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
    final menuController = Get.put(SidebarController());
    return InkWell(
      onTap: () => menuController.menuOnTap(route),
      onHover: (hovering) => hovering
          ? menuController.changeActiveItem(route)
          : menuController.changeActiveItem(''),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: ESizes.xs),
          child: Container(
            decoration: BoxDecoration(
                color: menuController.isHovering(route) ||
                        menuController.isHovering(route)
                    ? EColor.primaryColor
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
                  child: menuController.isActive(route)
                      ? Icon(
                          icon,
                          size: 22,
                          color: EColor.white,
                        )
                      : Icon(
                          icon,
                          size: 22,
                          color: menuController.isHovering(route)
                              ? EColor.white
                              : EColor.darkGrey,
                        ),
                ),

                // Text
                if (menuController.isHovering(route) ||
                    menuController.isActive(route))
                  Flexible(
                    child: Text(
                      itemName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: EColor.white),
                    ),
                  )
                else
                  Flexible(
                    child: Text(
                      itemName,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: EColor.darkGrey),
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
