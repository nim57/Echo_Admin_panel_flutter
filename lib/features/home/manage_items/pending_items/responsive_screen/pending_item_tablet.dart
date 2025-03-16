import 'package:flutter/material.dart';

import '../../../../../Utils/constants/sizes.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../routes/route.dart';
import '../../../dashboard/widgets/breadcrumb_with_heading.dart';
import '../tables/data_table.dart';

class PendingItemTablet extends StatelessWidget {
  const PendingItemTablet({super.key});

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
              heading: 'Pending Item',
              breadcrumbItems: [ERoutes.manageItems, 'Pending Item'],
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

                  // Table
                  PendinItemTable(),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
