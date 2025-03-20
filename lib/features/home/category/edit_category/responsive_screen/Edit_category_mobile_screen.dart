import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Utils/constants/sizes.dart';
import '../../../../../routes/route.dart';
import '../../../dashboard/widgets/breadcrumb_with_heading.dart';
import '../widgets/Edit_category_form.dart';

class EditCategoryMobileScreen extends StatelessWidget {
  const EditCategoryMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BreadCrumb
              EBreadcrumbsWithHeading(heading: 'Update Category', breadcrumbItems: [ERoutes.category, 'Update Category'], returnToPreviousScreen: true),
              SizedBox(height: ESizes.spaceBtwSections,),

              // Form 
              EditCategoryForm(categoryId: Get.arguments as String,),
            ],
          ),
        ),
      ),
    );
  }
}
