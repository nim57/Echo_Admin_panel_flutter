import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/Utils/validators/validation.dart';
import 'package:echo_admin_panel_flutter/common/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/images/i_circularImage.dart';
import '../../../../../routes/route.dart';
import '../../../category/create_categort/widgets/image_upload.dart';
import '../../add Item/backend/item_controller.dart';


class UpdateItemForm extends StatefulWidget {
  final String itemId;
  const UpdateItemForm({super.key, required this.itemId});

  @override
  State<UpdateItemForm> createState() => UpdateItemFormState();
}

class UpdateItemFormState extends State<UpdateItemForm> {
  final ItemController _controller = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.loadItemForEdit(widget.itemId);
    });
  }

  // Map picker handler method
  void _openMapPickerHandler() async {
    final newLocation = await Get.toNamed(
      ERoutes.mapPicker,
      arguments: _controller.mapLocationController.text,
    );
    if (newLocation != null) {
      _controller.updateMapLocation(newLocation);
    }
  }
  @override
  Widget build(BuildContext context) {
    return ERoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(ESizes.defaultSpace),
      child: Obx(() {
        if (_controller.itemLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: ESizes.spaceBtwSections),

                /// Category ID Dropdown
                Text('Category ID', style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: ESizes.spaceBtwItems / 2),
                DropdownButtonFormField<String>(
                  value: _controller.categoryIdController.text.isEmpty
                      ? 'Select Category'
                      : _controller.categoryIdController.text,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.category),
                    border: OutlineInputBorder(),
                  ),
                  items: _controller.categoryIds.map((String categoryId) {
                    return DropdownMenuItem<String>(
                      value: categoryId,
                      child: Text(categoryId),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    _controller.categoryIdController.text = newValue!;
                  },
                ),

                SizedBox(height: ESizes.spaceBtwInputFields),

                /// Item Name
                TextFormField(
                  controller: _controller.nameController,
                  validator: (value) => EValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                    labelText: 'Item Name',
                    prefixIcon: Icon(Iconsax.shopping_cart),
                  ),
                ),

                SizedBox(height: ESizes.spaceBtwInputFields),

                /// Tags
                TextFormField(
                  controller: _controller.tagsController,
                  validator: (value) => EValidator.validateEmptyText('Tags', value),
                  decoration: const InputDecoration(
                    labelText: '# Tags',
                    prefixIcon: Icon(Iconsax.tag),
                  ),
                ),

                SizedBox(height: ESizes.spaceBtwInputFields),

                /// Description
                Text('Description', style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: ESizes.spaceBtwItems / 2),
                TextFormField(
                  controller: _controller.descriptionController,
                  validator: (value) => EValidator.validateEmptyText('Description', value),
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Enter item description...',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: ESizes.spaceBtwInputFields),

                /// Email
                TextFormField(
                  controller: _controller.emailController,
                  validator: (value) => EValidator.validateEmail(value),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Iconsax.message),
                  ),
                ),

                SizedBox(height: ESizes.spaceBtwInputFields),

                /// Website URL
                TextFormField(
                  controller: _controller.websiteController,
                  validator: (value) => EValidator.validateEmptyText('Website URL', value),
                  decoration: const InputDecoration(
                    labelText: 'Website URL',
                    prefixIcon: Icon(Iconsax.global),
                  ),
                ),

                SizedBox(height: ESizes.spaceBtwInputFields),

                /// Mobile Number
                TextFormField(
                  controller: _controller.phoneController,
                  validator: (value) => EValidator.validatePhoneNumber(value),
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    prefixIcon: Icon(Iconsax.call),
                  ),
                ),

                SizedBox(height: ESizes.spaceBtwInputFields),

                /// Map Location
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _controller.mapLocationController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Map Location',
                          prefixIcon: Icon(Iconsax.location),
                        ),
                      ),
                    ),
                    SizedBox(width: ESizes.spaceBtwItems),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton.icon(
                        onPressed: _openMapPicker,
                        icon: const Icon(Iconsax.map),
                        label: const Text('Choose'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: ESizes.spaceBtwInputFields * 1.5),

                /// Profile Image
                Center(
                  child: Column(
                    children: [
                      Text('Profile Image', style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(height: ESizes.spaceBtwItems),
                      EImageUploader(
                        imageType: _controller.selectedItem.value.profileImage.isNotEmpty
                            ? ImageType.network
                            : ImageType.asset,
                        image: _controller.selectedItem.value.profileImage.isNotEmpty
                            ? _controller.selectedItem.value.profileImage
                            : EImages.onboardingImage1,
                        width: 80,
                        height: 80,
                        icon: Iconsax.edit_2,
                        onIconButtonPressed: _controller.uploadItemImage,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: ESizes.spaceBtwInputFields * 1.5),

                /// Branch Availability
                Text('Branch Available', style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: ESizes.spaceBtwItems / 2),
                DropdownButtonFormField<String>(
                  value: _controller.hasBranch.value ? 'Yes' : 'No',
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.building),
                    border: OutlineInputBorder(),
                  ),
                  items: const ['Yes', 'No'].map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    _controller.hasBranch.value = newValue == 'Yes';
                  },
                ),

                SizedBox(height: ESizes.spaceBtwSections),

                /// Update Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _controller.updateItem,
                    child: const Text('Update Item'),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _openMapPicker() async {
    final newLocation = await Get.toNamed(
      ERoutes.mapPicker,
      arguments: _controller.mapLocationController.text,
    );
    if (newLocation != null) {
      _controller.updateMapLocation(newLocation);
    }
  }
}