import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../Utils/constants/image_Strings.dart';
import '../../../../../Utils/popups/fullscreen_loader.dart';
import '../../../../../common/widgets/loaders/lodaders.dart';
import 'item_model.dart';
import 'item_repository.dart';

class ItemController extends GetxController {
  static ItemController get instance => Get.find();

  // Repositories & Services
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final itemRepository = Get.put(ItemRepository());

  // Observables
  final itemLoading = false.obs;
  final RxList<Item> items = <Item>[].obs;
  final RxList<String> categoryIds = <String>[].obs;
  final selectedItem = Item.empty().obs;
  final imageUploading = false.obs;
  final hasBranch = false.obs;

  // Form Controllers
  final categoryIdController = TextEditingController();
  final nameController = TextEditingController();
  final tagsController = TextEditingController();
  final descriptionController = TextEditingController();
  final emailController = TextEditingController();
  final websiteController = TextEditingController();
  final phoneController = TextEditingController();
  final mapLocationController = TextEditingController();

  // Workers
  late Worker _itemsWorker;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchAllItems();
    _setupWorkers();
  }

  void _setupWorkers() {
    _itemsWorker = ever(items, (_) => update());
  }

  /// Fetch all items with real-time updates
  Future<void> fetchAllItems() async {
    try {
      itemLoading.value = true;
      items.bindStream(itemRepository.getAllItemsStream());
    } catch (e) {
      items.assignAll([]);
      ELoaders.errorsnackBar(
          title: 'Load Failed', message: 'Failed to load items');
    } finally {
      itemLoading.value = false;
    }
  }

  /// Fetch available categories
  Future<void> fetchCategories() async {
    try {
      itemLoading.value = true;
      categoryIds.value = await itemRepository.getCategoryIds();
      if (categoryIds.isEmpty) {
        ELoaders.warningSnackBar(
            title: 'Warning', message: 'No categories found');
      }
    } catch (e) {
      categoryIds.assignAll([]);
      ELoaders.errorsnackBar(
          title: 'Error', message: 'Failed to load categories');
    } finally {
      itemLoading.value = false;
    }
  }

  /// Update map location
  void updateMapLocation(String locationUrl) {
    mapLocationController.text = locationUrl;
    update();
  }

  /// Clear map location
  void clearMapLocation() {
    mapLocationController.clear();
    update();
  }

  /// Create new item
  Future<void> createItem() async {
    try {
      EFullScreenLoader.openLoadingDialog('Creating Item...', EImages.E);

      if (categoryIdController.text.isEmpty) {
        throw 'Please select a category';
      }

      final newItem = Item(
        id: await itemRepository.generateItemId(),
        categoryId: categoryIdController.text.trim(),
        name: nameController.text.trim(),
        tags: tagsController.text.split(',').map((e) => e.trim()).toList(),
        description: descriptionController.text.trim(),
        email: emailController.text.trim(),
        website: websiteController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        mapLocation: mapLocationController.text.trim(),
        profileImage: selectedItem.value.profileImage,
        hasBranch: hasBranch.value,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await itemRepository.saveItem(newItem);
      items.add(newItem);

      clearForm();
      ELoaders.successSnackBar(
        title: 'Success!',
        message: 'Item created successfully',
      );
    } catch (e) {
      ELoaders.errorsnackBar(title: 'Error!', message: e.toString());
    } finally {
      EFullScreenLoader.stopLoading();
    }
  }

  /// Upload item image
  Future<void> uploadItemImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (image != null) {
        imageUploading.value = true;

        final foundation.Uint8List imageBytes;
        final String fileName;

        if (foundation.kIsWeb) {
          imageBytes = await image.readAsBytes();
          fileName = DateTime.now().millisecondsSinceEpoch.toString();
        } else {
          final File imageFile = File(image.path);
          imageBytes = await imageFile.readAsBytes();
          fileName = image.name;
        }

        final imageUrl =
            await itemRepository.uploadItemImage(imageBytes, fileName);
        selectedItem.value =
            selectedItem.value.copyWith(profileImage: imageUrl);

        ELoaders.successSnackBar(
          title: 'Success!',
          message: 'Image uploaded successfully',
        );
      }
    } catch (e, stackTrace) {
      print('Upload Error: $e\n$stackTrace');
      ELoaders.errorsnackBar(
        title: 'Upload Error!',
        message: 'Failed to upload image: ${e.toString()}',
      );
    } finally {
      imageUploading.value = false;
    }
  }

  /// Load item for editing
  Future<void> loadItemForEdit(String itemId) async {
    try {
      itemLoading.value = true;
      final item = await itemRepository.getItemById(itemId);
      selectedItem.value = item;
      _populateFormFields(item);
    } catch (e) {
      ELoaders.errorsnackBar(title: 'Error!', message: 'Failed to load item');
    } finally {
      itemLoading.value = false;
    }
  }

  /// Update existing item
  Future<void> updateItem() async {
    try {
      EFullScreenLoader.openLoadingDialog('Updating Item...', EImages.E);

      final updateData = <String, dynamic>{
        'categoryId': categoryIdController.text.trim(),
        'name': nameController.text.trim(),
        'tags': tagsController.text.split(',').map((e) => e.trim()).toList(),
        'description': descriptionController.text.trim(),
        'email': emailController.text.trim(),
        'website': websiteController.text.trim(),
        'phoneNumber': phoneController.text.trim(),
        'mapLocation': mapLocationController.text.trim(),
        'hasBranch': hasBranch.value,
        'updatedAt': DateTime.now(),
      };

      if (selectedItem.value.profileImage !=
          items.firstWhere((i) => i.id == selectedItem.value.id).profileImage) {
        updateData['profileImage'] = selectedItem.value.profileImage;
      }

      await itemRepository.updateItemFields(
        itemId: selectedItem.value.id,
        fields: updateData,
      );

      final index = items.indexWhere((i) => i.id == selectedItem.value.id);
      if (index != -1) {
        items[index] = items[index].copyWith(
          categoryId: updateData['categoryId'],
          name: updateData['name'],
          tags: updateData['tags'] as List<String>,
          description: updateData['description'],
          email: updateData['email'],
          website: updateData['website'],
          phoneNumber: updateData['phoneNumber'],
          mapLocation: updateData['mapLocation'],
          profileImage: updateData['profileImage'] ?? items[index].profileImage,
          hasBranch: updateData['hasBranch'],
          updatedAt: updateData['updatedAt'],
        );
      }

      ELoaders.successSnackBar(
        title: 'Success!',
        message: 'Item updated successfully',
      );
      Get.back();
    } catch (e) {
      ELoaders.errorsnackBar(title: 'Error!', message: e.toString());
    } finally {
      EFullScreenLoader.stopLoading();
    }
  }

  /// Delete item
  Future<void> deleteItem(String itemId) async {
    try {
      EFullScreenLoader.openLoadingDialog('Deleting...', EImages.E);
      await itemRepository.deleteItem(itemId);
      items.removeWhere((i) => i.id == itemId);
      ELoaders.successSnackBar(
        title: 'Success!',
        message: 'Item deleted successfully',
      );
    } catch (e) {
      ELoaders.errorsnackBar(title: 'Error!', message: e.toString());
    } finally {
      EFullScreenLoader.stopLoading();
      Get.back();
    }
  }

  /// Clear form fields
  void clearForm() {
    categoryIdController.clear();
    nameController.clear();
    tagsController.clear();
    descriptionController.clear();
    emailController.clear();
    websiteController.clear();
    phoneController.clear();
    mapLocationController.clear();
    hasBranch.value = false;
    selectedItem.value = Item.empty();
  }

  /// Populate form fields for editing
  void _populateFormFields(Item item) {
    categoryIdController.text = item.categoryId;
    nameController.text = item.name;
    tagsController.text = item.tags.join(', ');
    descriptionController.text = item.description;
    emailController.text = item.email;
    websiteController.text = item.website;
    phoneController.text = item.phoneNumber;
    mapLocationController.text = item.mapLocation;
    hasBranch.value = item.hasBranch;
  }

  @override
  void onClose() {
    _itemsWorker.dispose();
    super.onClose();
    categoryIdController.dispose();
    nameController.dispose();
    tagsController.dispose();
    descriptionController.dispose();
    emailController.dispose();
    websiteController.dispose();
    phoneController.dispose();
    mapLocationController.dispose();
  }
}
