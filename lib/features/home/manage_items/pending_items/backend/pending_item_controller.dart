// pending_item_controller.dart
import 'package:get/get.dart';
import 'package:logger/web.dart';

import '../../../../../Utils/constants/image_Strings.dart';
import '../../../../../Utils/popups/fullscreen_loader.dart';
import '../../../../../common/widgets/loaders/lodaders.dart';
import '../../add Item/backend/item_model.dart';
import '../../add Item/backend/item_repository.dart';
import 'pending item_model.dart';

import 'pending_item_repository.dart';

class PendingItemController extends GetxController {
  static PendingItemController get instance => Get.find();

   final ItemRepository _itemRepository = Get.put(ItemRepository());
  final PendingItemRepository _repository = PendingItemRepository();
  final RxList<PendingItem> pendingItems = <PendingItem>[].obs;
  final RxBool isLoading = false.obs;
  final Logger _logger = Logger();

  @override
  void onInit() {
    loadPendingItems();
    super.onInit();
  }

  Future<void> loadPendingItems() async {
    try {
      isLoading(true);
      final items = await _repository.fetchPendingItems();
      pendingItems.assignAll(items);
    } catch (e, stackTrace) {
      _logger.e("Error loading pending items",
          error: e, stackTrace: stackTrace);
      Get.snackbar(
        'Error!',
        'Failed to load pending items: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
    } finally {
      isLoading(false);
    }
  }

   Future<void> approveItem(PendingItem item) async {
    try {
      EFullScreenLoader.openLoadingDialog('Approving Item...', EImages.E);
      
      // Convert PendingItem to Item
      final newItem = Item(
        id: await _itemRepository.generateItemId(),
        categoryId: item.categoryId,
        name: item.name,
        tags: item.tags,
        description: item.description,
        email: item.email,
        website: item.website,
        phoneNumber: item.phone,
        mapLocation: item.mapLocation,
        profileImage: item.imageUrl,
        hasBranch: item.hasBranch,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Save to main items collection
      await _itemRepository.saveItem(newItem);
      
      // Remove from pending
      await _deletePendingItem(item.id);
      
      ELoaders.successSnackBar(title: 'Success', message: 'Item approved');
    } catch (e) {
      ELoaders.errorsnackBar(title: 'Error', message: e.toString());
    } finally {
      EFullScreenLoader.stopLoading();
    }
  }

  Future<void> rejectItem(String itemId, String message, String userEmail) async {
    try {
      EFullScreenLoader.openLoadingDialog('Rejecting Item...', EImages.E);
      
      // Send rejection email
      await _sendRejectionEmail(userEmail, message);
      
      // Remove from pending
      await _deletePendingItem(itemId);
      
      ELoaders.successSnackBar(
        title: 'Success', 
        message: 'Item rejected and email sent',
      );
    } catch (e) {
      ELoaders.errorsnackBar(title: 'Error', message: e.toString());
    } finally {
      EFullScreenLoader.stopLoading();
    }
  }

  Future<void> _deletePendingItem(String itemId) async {
    // Implement your pending items deletion logic
    // Example: await FirebaseFirestore.instance.collection('pending_items').doc(itemId).delete();
    pendingItems.removeWhere((item) => item.id == itemId);
  }

  Future<void> _sendRejectionEmail(String email, String message) async {
    // Implement your email sending logic here
    // This could be a call to a Firebase Cloud Function
    // Example: 
    // await FirebaseFunctions.instance.httpsCallable('sendRejectionEmail').call({
    //   'email': email,
    //   'message': message
    // });
    print('Sending email to $email with message: $message');
  }
}