import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Utils/constants/sizes.dart';
import '../../../../../Utils/constants/text_strings.dart';
import '../../../../../routes/route.dart';

class HeaderAndForm extends StatelessWidget {
  const HeaderAndForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        IconButton(
            onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)),
        const SizedBox(
          height: ESizes.spaceBtwItems,
        ),
        Text(
          ETexts.forgotPasswordTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: ESizes.spaceBtwItems,
        ),
        Text(
          ETexts.forgotPasswordSubtitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: ESizes.spaceBtwSections * 2),

        Form(
          child:

              /// Text Field
              /// Email
              TextFormField(
            decoration: InputDecoration(
              labelText: ETexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
        ),
        const SizedBox(
          height: ESizes.spaceBtwInputFields,
        ),

        /// Sumit Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(ERoutes.resetPAssword,
                parameters: {'email': 'Nimeshsandaruwan268@gmail.com'}),
            child: const Text(ETexts.submit),
          ),
        ),
        const SizedBox(
          height: ESizes.spaceBtwSections * 2,
        )
      ],
    );
  }
}
