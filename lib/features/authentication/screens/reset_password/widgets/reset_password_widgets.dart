import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Utils/constants/image_Strings.dart';
import '../../../../../Utils/constants/sizes.dart';
import '../../../../../Utils/constants/text_strings.dart';
import '../../../../../routes/route.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? '';
    return Column(
      children: [
        /// Header
        Row(
          children: [
            IconButton(
                onPressed: () => Get.offAllNamed(ERoutes.login),
                icon: Icon(CupertinoIcons.clear)),
          ],
        ),
        const SizedBox(
          height: ESizes.spaceBtwItems,
        ),

        /// Image
        const Image(
          image: AssetImage(EImages.userProfileImage1),
          width: 300,
          height: 300,
        ),
        const SizedBox(
          height: ESizes.spaceBtwItems,
        ),

        /// Title & SubTitle
        Text(ETexts.changeYourPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center),
        const SizedBox(height: ESizes.spaceBtwItems),
        Text(email,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: ESizes.spaceBtwItems),
        Text(
          ETexts.changeYourPasswordSubtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        ), // Text
        const SizedBox(height: ESizes.spaceBtwSections),

        /// Buttons
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => Get.back(), child: const Text(ETexts.done)),
        ), // SizedBox
        const SizedBox(height: ESizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: TextButton(
              onPressed: () {}, child: const Text(ETexts.resendEmail)),
        ), // SizedBox
      ],
    );
  }
}
