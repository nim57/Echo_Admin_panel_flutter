
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Utils/constants/image_Strings.dart';
import '../../../../../Utils/constants/sizes.dart';
import '../../../../../Utils/validators/validation.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/images/i_circularImage.dart';
import '../../create_categort/cload_cods/category_controller.dart';
import '../../create_categort/widgets/image_upload.dart';

class EditCategoryForm extends StatelessWidget {
  EditCategoryForm({super.key, required this.categoryId}) {
    Get.find<CategoryController>().loadCategoryForEdit(categoryId);
  }

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();
    final formKey = GlobalKey<FormState>();

    return ERoundedContainer(
      width: 500,
      padding: const EdgeInsets.all(ESizes.defaultSpace),
      child: Form(
        key: formKey,
        child: Obx(() {
          if (controller.categoryLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          
          return Column(
            children: [
              /// Heading
              Text(
                'Update Category',
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
              Column(
                children: [
                  EImageUploader(
                    imageType: controller.selectedCategory.value.log.isNotEmpty 
                        ? ImageType.network 
                        : ImageType.asset,
                    image: controller.selectedCategory.value.log.isNotEmpty
                        ? controller.selectedCategory.value.log
                        : EImages.onboardingImage1,
                    width: 150,
                    height: 150,
                    icon: Iconsax.edit_2,
                    onIconButtonPressed: controller.uploadCategoryImage,
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems),
                  if (controller.imageUploading.value)
                    const CircularProgressIndicator(),
                ],
              ),
              const SizedBox(height: ESizes.spaceBtwSections * 2),

              /// Update Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await controller.updateCategory();
                      Get.back();
                    }
                  },
                  child: controller.categoryLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('Update Category'),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}