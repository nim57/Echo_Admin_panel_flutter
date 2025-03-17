import 'package:flutter/material.dart';

import '../../../../../../Utils/constants/sizes.dart';

import '../../../../../routes/route.dart';
import '../../../dashboard/widgets/breadcrumb_with_heading.dart';
import '../../add Item/widgets/create_Item_form.dart';


class ItemEditMobileScreen extends StatelessWidget {
  const ItemEditMobileScreen({super.key});

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
              heading: 'Update Item',
              breadcrumbItems: [ERoutes.manageItems, 'Update Item'],
              returnToPreviousScreen: true,
            ),
            const SizedBox(
              height: ESizes.spaceBtwSections,
            ),

            /// Form
            CreateItemForm(),
          ],
        ),
      ),
    ));
  }
}
