import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/features/home/category/edit_category/widgets/Edit_category_form.dart';
import 'package:echo_admin_panel_flutter/features/home/dashboard/widgets/breadcrumb_with_heading.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategoryDesktopScreen extends StatelessWidget {
  const EditCategoryDesktopScreen({
    super.key,
  });

  //final CategoryMobileScreen category;

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
              EBreadcrumbsWithHeading(
                  heading: 'Update Category',
                  breadcrumbItems: [ERoutes.category, 'Update Category'],
                  returnToPreviousScreen: true),
              SizedBox(
                height: ESizes.spaceBtwSections,
              ),

              // Form
              EditCategoryForm(
                categoryId: Get.arguments as String,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
