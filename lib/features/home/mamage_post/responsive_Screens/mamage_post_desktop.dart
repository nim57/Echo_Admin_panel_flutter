import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/constants/sizes.dart';
import '../../../../common/widgets/containers/rounded_container.dart';
import '../../../../routes/route.dart';
import '../../category/all_category/widgets/table_header.dart';
import '../../dashboard/widgets/breadcrumb_with_heading.dart';
import '../tables/data_table.dart';

class ManagePostDesktop extends StatelessWidget {
  const ManagePostDesktop({super.key});

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
              heading: 'Manage Post',
              breadcrumbItems: ['Manage Post'],
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
                    buttonText: 'Refresh',
                    onPressed: () => Get.toNamed(ERoutes.createCategory),
                  ),
                  SizedBox(
                    height: ESizes.spaceBtwItems,
                  ),

                  // Table
                  MamagePostTable(),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
