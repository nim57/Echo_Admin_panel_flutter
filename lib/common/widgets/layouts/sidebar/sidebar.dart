import 'package:echo_admin_panel_flutter/Utils/constants/colors.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/common/widgets/images/i_circularImage.dart';
import 'package:echo_admin_panel_flutter/common/widgets/layouts/sidebar/menu/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ESidebar extends StatelessWidget {
  const ESidebar({super.key});

  @override
  Widget build(BuildContext context) {
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
              /// Image
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

                    // // Menu Item
                    // EMenuItem(
                    //   route: '',
                    //   icon: Iconsax.status,
                    //   itemName: 'Dashboard',
                    // ),
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
