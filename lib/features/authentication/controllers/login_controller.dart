import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/Utils/popups/fullscreen_loader.dart';
import 'package:echo_admin_panel_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:echo_admin_panel_flutter/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'network_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorrage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormkey = GlobalKey<FormState>();

  // Handles email and pswword sign in process
  Future<void> emailAndPasswordSignIn() async {
    // check bonnection
  }

  // Handles registration of admin user
  Future<void> registerAdmin() async {
    // Start Loading
    EFullScreenLoader.openLoadingDialog(
        'Registering Admin Account...', EImages.userProfileImage1);

    // Check Internet Connection
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      EFullScreenLoader.stopLoading();
      return;
    }

    //   Register user sing Email& password Authenticatoion
    await AuthenticationRepository.instance
        .RegisterEmailAndPassword(ETexts.adminEmail, ETexts.a);
  }
}
