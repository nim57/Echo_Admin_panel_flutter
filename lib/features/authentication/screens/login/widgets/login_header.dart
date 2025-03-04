import 'package:flutter/material.dart';

import '../../../../../Utils/constants/image_Strings.dart';
import '../../../../../Utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

SizedBox ELoginHeader(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
            width: 100, height: 100, image: AssetImage(EImages.LightAppLogo)),
        const SizedBox(height: ESizes.spaceBtwSections / 2),
        Text(ETexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: ESizes.sm),
        Text(ETexts.loginSubtitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    ),
  );
}
