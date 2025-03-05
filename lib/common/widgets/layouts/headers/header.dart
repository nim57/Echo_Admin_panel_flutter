import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/common/widgets/layouts/headers/i_rounded_image.dart';
import 'package:echo_admin_panel_flutter/features/authentication/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Utils/constants/colors.dart';
import '../../../../Utils/constants/sizes.dart';
import '../../../../Utils/device/device_utility.dart';
import '../templates/shimmer.dart';

/// Header widget for the application
class EHeader extends StatelessWidget implements PreferredSizeWidget {
  const EHeader({super.key, this.scaffoldKey});

  /// GloablKey to acceess the Scaffold state
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instonce;
    return Container(
      decoration: const BoxDecoration(
        color: EColor.white,
        border: Border(bottom: BorderSide(color: EColor.grey, width: 1)),
      ), // BoxDecoration
      padding: const EdgeInsets.symmetric(
          horizontal: ESizes.md, vertical: ESizes.sm),
      child: AppBar(
        leading: !EDeviceUtils.isDesktopScreen(context)
            ? IconButton(onPressed: () {}, icon: const Icon(Iconsax.menu))
            : null,

        /// Search Field
        title: EDeviceUtils.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.search_normal),
                        hintText: 'Search amythings...')),
              )
            : null,

        /// Action
        actions: [
          /// Search Icon on Mobile
          if (!EDeviceUtils.isDesktopScreen(context))
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.search_normal),
            ),

          /// Notification Icon
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.notification),
          ),
          const SizedBox(
            width: ESizes.spaceBtwItems / 2,
          ),

          /// USer Data
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Image
              Obx(
                () => ERoundeImage(
                  imageType: controller.user.value.profilePicture.isNotEmpty
                      ? ImageType.network
                      : ImageType.asset,
                  image: controller.user.value.profilePicture.isNotEmpty
                      ? controller.user.value.profilePicture
                      : EImages.user1,
                ),
              ),
            ],
          ),
          SizedBox(
            width: ESizes.sm,
          ),

          // NAme And Image
          if (!EDeviceUtils.isMobileScreen(context))
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.loading.value
                      ? const EShimmerEffect(width: 50, height: 13)
                      : Text(
                          controller.user.value.fullname,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                  controller.loading.value
                      ? const EShimmerEffect(width: 50, height: 13)
                      : Text(
                          controller.user.value.email,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                ],
              ),
            )
        ],
      ),
    ); // Container
  }

  @override
// TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(EDeviceUtils.getAppBorHeight() + 15);
}
