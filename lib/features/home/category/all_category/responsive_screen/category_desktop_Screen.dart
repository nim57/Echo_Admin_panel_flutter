import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/common/widgets/containers/rounded_container.dart';
import 'package:echo_admin_panel_flutter/features/home/category/all_category/widgets/table_header.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../dashboard/widgets/breadcrumb_with_heading.dart';
import '../table/data_table.dart';

class CategoryDesktopScreen extends StatelessWidget {
  const CategoryDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadurumbs
            const EBreadcrumbsWithHeading(
              heading: 'Categories',
              breadcrumbItems: ['Category'],
              returnToPreviousScreen: false,
            ),
            const SizedBox(
              height: ESizes.spaceBtwSections,
            ),
            // Table Body

            // Show Loader
            ERoundedContainer(
              child: Column(
                children: [
                  // Table Header
                  CategoryTableHeader(
                    buttonText: 'Create New Category',
                    onPressed: () => Get.toNamed(ERoutes.createCategory),
                  ),
                  SizedBox(
                    height: ESizes.spaceBtwItems,
                  ),

                  // Table
                  CategoryTable(),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
