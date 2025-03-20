import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../Utils/constants/image_Strings.dart';
import '../../../../../Utils/constants/sizes.dart';
import '../../../../../Utils/validators/validation.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/images/i_circularImage.dart';
import '../../../category/create_categort/widgets/image_upload.dart';
import '../backend/item_controller.dart';
import '../backend/map_picker.dart';

class CreateItemForm extends StatelessWidget {
  CreateItemForm({super.key}) {
    Get.put(ItemController()).fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ItemController>();
    final formKey = GlobalKey<FormState>();

    return ERoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(ESizes.defaultSpace),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Text('Create New Item',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: ESizes.spaceBtwSections),

              // Category ID Dropdown
              Obx(() => DropdownButtonFormField<String>(
                    value: controller.categoryIds.isNotEmpty
                        ? controller.categoryIds.first
                        : null,
                    decoration: const InputDecoration(
                      labelText: 'Category ID',
                      prefixIcon: Icon(Iconsax.category),
                      border: OutlineInputBorder(),
                    ),
                    items: controller.categoryIds.map((String id) {
                      return DropdownMenuItem<String>(
                        value: id,
                        child: Text(id),
                      );
                    }).toList(),
                    onChanged: (value) =>
                        controller.categoryIdController.text = value ?? '',
                    validator: (value) =>
                        EValidator.validateEmptyText('Category ID', value),
                  )),
              const SizedBox(height: ESizes.spaceBtwInputFields),

              // Item Name
              TextFormField(
                controller: controller.nameController,
                validator: (value) =>
                    EValidator.validateEmptyText('Item Name', value),
                decoration: const InputDecoration(
                  labelText: 'Item Name',
                  prefixIcon: Icon(Iconsax.shopping_cart),
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwInputFields),

              // Tags
              TextFormField(
                controller: controller.tagsController,
                validator: (value) =>
                    EValidator.validateEmptyText('Tags', value),
                decoration: const InputDecoration(
                  labelText: 'Tags (comma separated)',
                  prefixIcon: Icon(Iconsax.tag),
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwInputFields),

              // Description
              TextFormField(
                controller: controller.descriptionController,
                validator: (value) =>
                    EValidator.validateEmptyText('Description', value),
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter item description...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwInputFields),

              // Email
              TextFormField(
                controller: controller.emailController,
                validator: EValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Iconsax.message),
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwInputFields),

              // Website URL
              TextFormField(
                controller: controller.websiteController,
                validator: EValidator.validateWebsite,
                decoration: const InputDecoration(
                  labelText: 'Website URL',
                  prefixIcon: Icon(Iconsax.global),
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwInputFields),

              // Mobile Number
              TextFormField(
                controller: controller.phoneController,
                validator: EValidator.validatePhoneNumber,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Iconsax.call),
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwInputFields),

              // Map Location
              // In the form widget
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.mapLocationController,
                      readOnly: true,
                      validator: (value) =>
                          EValidator.validateEmptyText('Map Location', value),
                      decoration: const InputDecoration(
                        labelText: 'Map Location',
                        prefixIcon: Icon(Iconsax.location),
                      ),
                    ),
                  ),
                  const SizedBox(width: ESizes.spaceBtwItems),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final location =
                            await Get.to(() => const MapPickerScreen());
                        if (location != null) {
                          controller.updateMapLocation(location);
                        }
                      },
                      icon: const Icon(Iconsax.map),
                      label: const Text('Choose'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: ESizes.spaceBtwInputFields * 1.5),

              // Profile Image
              Obx(() => Column(
                    children: [
                      EImageUploader(
                        image: controller
                                .selectedItem.value.profileImage.isNotEmpty
                            ? controller.selectedItem.value.profileImage
                            : EImages.onboardingImage1,
                        imageType: controller
                                .selectedItem.value.profileImage.isNotEmpty
                            ? ImageType.network
                            : ImageType.asset,
                        width: 120,
                        height: 120,
                        onIconButtonPressed: controller.uploadItemImage,
                      ),
                      if (controller.imageUploading.value)
                        const Padding(
                          padding: EdgeInsets.only(top: ESizes.sm),
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  )),
              const SizedBox(height: ESizes.spaceBtwInputFields * 1.5),

              // Branch Availability
              Obx(() => DropdownButtonFormField<String>(
                    value: controller.hasBranch.value ? 'Yes' : 'No',
                    decoration: const InputDecoration(
                      labelText: 'Branch Available',
                      prefixIcon: Icon(Iconsax.building),
                      border: OutlineInputBorder(),
                    ),
                    items: const ['Yes', 'No'].map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (value) =>
                        controller.hasBranch.value = value == 'Yes',
                  )),
              const SizedBox(height: ESizes.spaceBtwInputFields),

              // Creation Date
              TextFormField(
                readOnly: true,
                initialValue: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                decoration: const InputDecoration(
                  labelText: 'Creation Date',
                  prefixIcon: Icon(Iconsax.calendar),
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwSections),

              // Submit Button
              Obx(() => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.itemLoading.value
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                controller.createItem();
                              }
                            },
                      child: controller.itemLoading.value
                          ? const CircularProgressIndicator()
                          : const Text('Create Item'),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
