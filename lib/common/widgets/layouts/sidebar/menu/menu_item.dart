import 'package:echo_admin_panel_flutter/common/widgets/layouts/sidebar/menu/sidebar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Utils/constants/colors.dart';
import '../../../../../Utils/constants/sizes.dart';

class EMenuItem extends StatelessWidget {
  const EMenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.itemName,
  });

  final String route;
  final IconData icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<SidebarController>();
    return InkWell(
      onTap: () => menuController.menuOnTap(route),
      onHover: (hovering) => hovering
          ? menuController.changeHoverItem(route)
          : menuController.changeHoverItem(''),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: ESizes.xs),
          child: Container(
            decoration: BoxDecoration(
                color: menuController.isActive(route)
                    ? Colors.blue
                        .withOpacity(0.2) // Blue background for active item
                    : menuController.isHovering(route)
                        ? Colors.grey.withOpacity(0.1) // Subtle hover effect
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(ESizes.cardRadiusNd)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: ESizes.lg,
                    top: ESizes.md,
                    bottom: ESizes.md,
                    right: ESizes.md,
                  ),
                  child: Icon(
                    icon,
                    size: 22,
                    color: menuController.isActive(route)
                        ? Colors.blue // Blue icon for active item
                        : menuController.isHovering(route)
                            ? Colors.white
                            : EColor.darkGrey,
                  ),
                ),

                // Text
                Flexible(
                  child: Text(
                    itemName,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: menuController.isActive(route)
                            ? Colors.blue // Blue text for active item
                            : menuController.isHovering(route)
                                ? Colors.white
                                : EColor.darkGrey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
