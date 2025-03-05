import 'package:echo_admin_panel_flutter/data/repositories/user/user_model.dart';
import 'package:echo_admin_panel_flutter/data/repositories/user/user_repository.dart';
import 'package:get/get.dart';

import '../../../Utils/popups/fullscreen_loader.dart';
import '../../../common/widgets/loaders/lodaders.dart';

class UserController extends GetxController {
  static UserController get instonce => Get.find();

  RxBool loading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  /// Feaches user deatails from the repository
  Future<UserModel> fetchUserDetails() async {
    try {
      loading.value = true;
      final user = await userRepository.fetchAdminDetails();
      this.user.value = user;
      loading.value = false;
      return user;
    } catch (e) {
      loading.value = false;
      EFullScreenLoader.stopLoading();
      ELoaders.errorsnackBar(
          title: 'Somthing want worng', message: e.toString());
      return UserModel.empty();
    }
  }
}
