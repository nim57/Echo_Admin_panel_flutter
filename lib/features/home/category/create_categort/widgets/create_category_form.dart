import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/Utils/validators/validation.dart';
import 'package:echo_admin_panel_flutter/common/widgets/containers/rounded_container.dart';
import 'package:echo_admin_panel_flutter/common/widgets/images/i_circularImage.dart';


import '../cload_cods/category_controller.dart';

class CreateCategoryForm extends StatelessWidget {
  const CreateCategoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final formKey = GlobalKey<FormState>();

    return ERoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(ESizes.defaultSpace),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'Create New Category',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: ESizes.spaceBtwSections),

            /// Category Name
            TextFormField(
              controller: controller.nameController,
              validator: (value) => EValidator.validateEmptyText('Category Name', value),
              decoration: const InputDecoration(
                labelText: 'Category Name',
                prefixIcon: Icon(Iconsax.category),
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwSections * 2),

            /// Image Upload Section
            Obx(() => Column(
              children: [
                /// Image Preview
                if (controller.selectedCategory.value.log.isNotEmpty)
                  TCircularImage(
                    imageType: ImageType.network,
                    image: controller.selectedCategory.value.log,
                    width: 100,
                    height: 100,
                    padding: 0,
                  )
                else
                  const TCircularImage(
                    imageType: ImageType.asset,
                    image: EImages.onboardingImage1,
                    width: 100,
                    height: 100,
                    padding: 0,
                  ),

                /// Upload Button
                TextButton.icon(
                  onPressed: () async {
                    await controller.uploadCategoryImage();
                    if (controller.selectedCategory.value.log.isEmpty) {
                      Get.snackbar('Error', 'Please select an image');
                    }
                  },
                  icon: const Icon(Iconsax.image),
                  label: Obx(() => Text(
                    controller.imageUploading.value 
                      ? 'Uploading...' 
                      : 'Upload Category Image',
                  )),
                ),
              ],
            )),
            const SizedBox(height: ESizes.spaceBtwSections * 2),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: Obx(() => ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (controller.selectedCategory.value.log.isEmpty) {
                      Get.snackbar('Error', 'Please upload an image');
                      return;
                    }
                    await controller.createCategory();
                  }
                },
                child: controller.categoryLoading.value
                    ? const CircularProgressIndicator()
                    : const Text('Create Category'),
              )),
            ),
          ],
        ),
      ),
    );
  }
}