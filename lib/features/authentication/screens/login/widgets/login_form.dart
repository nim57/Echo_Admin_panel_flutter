import 'package:echo_admin_panel_flutter/features/authentication/screens/forget_password/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/login_controller.dart';

class ELoginForm extends StatelessWidget {
  const ELoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormkey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: ESizes.spaceBtwSections),
          child: Column(
            children: [
              /// Email
              TextFormField(
                controller: controller.email,
                validator: (value) => EValidator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: ETexts.Email_Address),
              ),
              const SizedBox(
                height: ESizes.spaceBtwInputFields,
              ),

              /// password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (Value) =>
                      EValidator.validateEmptyText('Password', Value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    labelText: ETexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye)),
                  ),
                ),
              ),
              const SizedBox(
                height: ESizes.spaceBtwInputFields / 2,
              ),

              /// Remember me & fought password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Rember me
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) =>
                                controller.rememberMe.value = value!),
                      ),
                      const Text(ETexts.rememberMe),
                    ],
                  ),

                  /// Forget password
                  TextButton(
                      onPressed: () => Get.to(() => ForgetPasswordScreen()),
                      child: const Text(ETexts.forgotPassword)),
                ],
              ),
              const SizedBox(height: ESizes.spaceBtwInputFields),

              // Sign in Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(ETexts.signin)),

                // child: ElevatedButton(
                //      onPressed: () => controller.registerAdmin(),
                //      child: const Text(ETexts.signin)),
              ),

              const SizedBox(height: ESizes.spaceBtwInputFields),
            ],
          ),
        ));
  }
}
