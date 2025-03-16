import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EBreadcrumbsWithHeading extends StatelessWidget {
  const EBreadcrumbsWithHeading({
    super.key,
    required this.heading,
    required this.breadcrumbItems,
    required this.returnToPreviousScreen,
  });

  final String heading;
  final List<String> breadcrumbItems;
  final bool returnToPreviousScreen;

  // Helper method to capitalize string
  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Breadcrumb trail
        Row(
          children: [
            // Dashboard Link
            InkWell(
              onTap: () => Get.offAllNamed(ERoutes.dashboard),
              child: Padding(
                padding: const EdgeInsets.all(ESizes.xs),
                child: Text(
                  'Dashboard',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(fontWeightDelta: -1),
                ),
              ),
            ),

            // Breadcrumb items
            for (int i = 0; i < breadcrumbItems.length; i++)
              Row(
                children: [
                  const Text('/'),
                  InkWell(
                    // Last item should not be clickable
                    onTap: i == breadcrumbItems.length - 1
                        ? null
                        : () => Get.offAllNamed(breadcrumbItems[i]),
                    child: Padding(
                      padding: const EdgeInsets.all(ESizes.xs),
                      // Format breadcrumb item: capitalize and remove leading '/'
                      child: Text(
                        i == breadcrumbItems.length - 1
                            ? breadcrumbItems[i].capitalize!
                            : capitalize(breadcrumbItems[i].substring(1)),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(fontWeightDelta: -1),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),

        const SizedBox(height: ESizes.sm),

        // Heading of the page
        Row(
          children: [
            if (returnToPreviousScreen)
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left),
              ),
            if (returnToPreviousScreen)
              const SizedBox(width: ESizes.spaceBtwItems),

            // Add the heading text
            Expanded(
              child: Text(
                heading,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
