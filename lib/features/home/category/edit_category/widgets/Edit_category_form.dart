import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Utils/constants/image_Strings.dart';
import '../../../../../Utils/constants/sizes.dart';
import '../../../../../Utils/validators/validation.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/images/i_circularImage.dart';
import '../../create_categort/widgets/image_upload.dart';

class EditCategoryForm extends StatelessWidget {
  const EditCategoryForm({super.key, y});

  //final CategoryMobileScreen category;

  @override
  Widget build(BuildContext context) {
    return ERoundedContainer(
      width: 500,
      padding: EdgeInsets.all(ESizes.defaultSpace),
      child: Form(
          child: Column(
        children: [
          /// Heading
          SizedBox(
            height: ESizes.sm,
          ),
          Text(
            'Update Category',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: ESizes.spaceBtwSections,
          ),

          /// Category Name
          TextFormField(
            validator: (value) => EValidator.validateEmptyText('Name', value),
            decoration: InputDecoration(
              labelText: 'Category Name',
              prefixIcon: Icon(Iconsax.category),
            ),
          ),

          SizedBox(
            height: ESizes.spaceBtwSections,
          ),

          SizedBox(
            height: ESizes.spaceBtwInputFields * 2,
          ),

          EImageUploader(
            imageType: ImageType.asset,
            image: EImages.onboardingImage1,
            width: 80,
            height: 80,
            icon: Iconsax.edit_2,
            onIconButtonPressed: () {},
          ),

          SizedBox(
            height: ESizes.spaceBtwInputFields,
          ),

          /// Submit Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Create'),
            ),
          ),

          SizedBox(
            height: ESizes.spaceBtwInputFields * 2,
          ),
        ],
      )),
    );
  }
}
