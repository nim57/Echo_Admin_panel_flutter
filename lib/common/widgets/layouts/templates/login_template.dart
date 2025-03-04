import 'package:echo_admin_panel_flutter/Utils/helpers/helper_function.dart';
import 'package:echo_admin_panel_flutter/features/authentication/screens/login/responcive_screen/spacing_styles.dart';
import 'package:echo_admin_panel_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../Utils/constants/sizes.dart';

class ELoginTemplate extends StatelessWidget {
  const ELoginTemplate({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: ESpacingStyle.paddingWithAppBarHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ESizes.cordRadiusLg),
              color: EHelperFunctions.isDarkMode(context)
                  ? EColor.black
                  : Colors.white,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
