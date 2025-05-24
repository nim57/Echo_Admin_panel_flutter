import 'package:echo_admin_panel_flutter/Utils/constants/colors.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/common/widgets/images/i_circularImage.dart';
import 'package:echo_admin_panel_flutter/common/widgets/layouts/sidebar/menu/sidebar_controller.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'menu/menu_item.dart';

class ESidebar extends StatelessWidget {
  const ESidebar({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller at the sidebar level
    // and set dashboard as default selected route
    final menuController = Get.put(SidebarController());

    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: EColor.white,
          border: Border(right: BorderSide(color: EColor.grey, width: 1)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Logo Image
              TCircularImage(
                width: 100,
                height: 100,
                image: EImages.LightAppLogo,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: ESizes.spaceBtwSections,
              ),
              Padding(
                padding: const EdgeInsets.all(ESizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'MENU',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(letterSpacingDelta: 1.2),
                    ),
                    const SizedBox(height: ESizes.sm),

                    // Menu Items
                    EMenuItem(
                      route: ERoutes.dashboard,
                      icon: Iconsax.status,
                      itemName: 'Dashboard',
                    ),

                    EMenuItem(
                      route: ERoutes.category,
                      icon: Iconsax.category,
                      itemName: 'Category',
                    ),

                    EMenuItem(
                      route: ERoutes.user_manage,
                      icon: Iconsax.user_edit,
                      itemName: 'Manage User',
                    ),

                    EMenuItem(
                      route: ERoutes.manageItems,
                      icon: Iconsax.menu,
                      itemName: 'Manage Items',
                    ),

                    EMenuItem(
                      route: ERoutes.managePost,
                      icon: Iconsax.edit,
                      itemName: 'Manage Post',
                    ),

                    EMenuItem(
                      route: ERoutes.manageNotification,
                      icon: Iconsax.notification,
                      itemName: 'Manage Notification',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
