import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/features/authentication/screens/reset_password/widgets/reset_password_widgets.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreenMobile extends StatelessWidget {
  const ResetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: ResetPasswordWidget(),
        ),
      ),
    );
  }
}
