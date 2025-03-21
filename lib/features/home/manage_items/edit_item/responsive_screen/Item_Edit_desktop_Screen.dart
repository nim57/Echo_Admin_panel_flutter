import 'package:flutter/material.dart';
import '../../../../../../Utils/constants/sizes.dart';
import '../../../../../../routes/route.dart';
import '../../../dashboard/widgets/breadcrumb_with_heading.dart';
import '../widgets/update_item_form.dart';

class ItemEditDesktopScreen extends StatelessWidget {
  const ItemEditDesktopScreen({super.key, required this.itemID});

  final String itemID;

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
            UpdateItemForm(
              itemId: itemID,
            ),
          ],
        ),
      ),
    ));
  }
}
