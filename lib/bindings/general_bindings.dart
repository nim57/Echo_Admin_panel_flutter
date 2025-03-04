import 'package:echo_admin_panel_flutter/features/authentication/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../features/authentication/controllers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// --Core
    Get.lazyPut(() => NetworkManager(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
  }
}
