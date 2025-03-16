import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Utils/constants/sizes.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../routes/route.dart';
import '../../../dashboard/widgets/breadcrumb_with_heading.dart';
import '../table/data_table.dart';
import '../widgets/table_header.dart';

class CategoryMobileScreen extends StatelessWidget {
  const CategoryMobileScreen({super.key});

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
