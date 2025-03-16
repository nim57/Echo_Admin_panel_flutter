import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Utils/constants/sizes.dart';

import '../../../../../routes/route.dart';
import '../../../dashboard/widgets/breadcrumb_with_heading.dart';
import '../widgets/create_Item_form.dart';

class ItemAddMobileScreen extends StatelessWidget {
  const ItemAddMobileScreen({super.key});

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
              heading: 'Add Item',
              breadcrumbItems: [ERoutes.manageItems, 'Add Item'],
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
