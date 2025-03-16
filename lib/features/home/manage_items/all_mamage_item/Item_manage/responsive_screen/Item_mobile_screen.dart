import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Utils/constants/sizes.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../routes/route.dart';
import '../../../../category/all_category/widgets/table_header.dart';
import '../../../../dashboard/widgets/breadcrumb_with_heading.dart';
import '../../table/data_table.dart';

class ItemMobileScreen extends StatelessWidget {
  const ItemMobileScreen({super.key});

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
              heading: 'Manage Item',
              breadcrumbItems: ['Manage Item'],
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryTableHeader(
                        buttonText: 'Add New Item',
                        onPressed: () => Get.toNamed(ERoutes.createCategory),
                      ),

                      SizedBox(
                        height: ESizes.spaceBtwItems,
                      ),

                      // Pending Item

                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Pending Item Request')),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: ESizes.spaceBtwItems,
                  ),

                  // Table
                  ManageItemTable(),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}