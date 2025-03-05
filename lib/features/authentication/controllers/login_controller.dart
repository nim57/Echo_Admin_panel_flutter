import 'package:echo_admin_panel_flutter/Utils/constants/enums.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/Utils/popups/fullscreen_loader.dart';
import 'package:echo_admin_panel_flutter/common/widgets/loaders/lodaders.dart';
import 'package:echo_admin_panel_flutter/data/repositories/authentication/authentication_repository.dart';
import 'package:echo_admin_panel_flutter/data/repositories/user/user_model.dart';
import 'package:echo_admin_panel_flutter/data/repositories/user/user_repository.dart';
import 'package:echo_admin_panel_flutter/features/authentication/controllers/user_controller.dart';
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

  @override
  void onInit() {
    email.text = localStorrage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorrage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Handles email and pswword sign in process
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      EFullScreenLoader.openLoadingDialog(
          'Registering Admin Account...', EImages.userProfileImage1);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!loginFormkey.currentState!.validate()) {
        EFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember me is Selected
      if (rememberMe.value) {
        localStorrage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorrage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //   Login user sing Email& password Authenticatoion
      await AuthenticationRepository.instance
          .loginWihtEmailAndPassword(email.text.trim(), password.text.trim());

      // Feach user details and assing to USerController
      final user = await UserController.instonce.fetchUserDetails();

      // REmove Loader
      EFullScreenLoader.stopLoading();

      // if user is not admin, loguot and return
      if (user.role != AppRole.admin) {
        await AuthenticationRepository.instance.logout();
        ELoaders.errorsnackBar(
            title: 'Not Authorized',
            message:
                'You are not authorized or do have access. Contact Admin.');
      } else {
        // Redirect
        AuthenticationRepository.instance.screenRedirect();
      }
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ELoaders.errorsnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // Handles registration of admin user
  Future<void> registerAdmin() async {
    try {
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
          .RegisterEmailAndPassword(ETexts.adminEmail, ETexts.adminPassword);

      // Create admin record in the Firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.createUser(UserModel(
        id: AuthenticationRepository.instance.authUser!.uid,
        firstName: 'Echo',
        lastName: 'Admin',
        email: ETexts.adminEmail,
        role: AppRole.admin,
        createdAt: DateTime.now(),
      ));

      // REmove Loader
      EFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      EFullScreenLoader.stopLoading();
      ELoaders.errorsnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
