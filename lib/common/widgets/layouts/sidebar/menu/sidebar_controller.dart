import 'package:get/get.dart';

import '../../../../../Utils/device/device_utility.dart';
import '../../../../../routes/route.dart';

class SidebarController extends GetxController {
  final activeItem = ERoutes.dashboard.obs;
  final hoverItem = ''.obs;

  @override
  void onInit() {
    // Set dashboard as the default selected route
    activeItem.value = ERoutes.dashboard;
    super.onInit();
  }

  void changeActiveItem(String route) => activeItem.value = route;

  void changeHoverItem(String route) {
    if (!isActive(route)) hoverItem.value = route;
  }

  bool isActive(String route) => activeItem.value == route;
  bool isHovering(String route) => hoverItem.value == route;

  void menuOnTap(String route) {
    if (!isActive(route)) {
      changeActiveItem(route);

      if (EDeviceUtils.isMobileScreen(Get.context!)) Get.back();

      Get.toNamed(route);
    }
  }
}
