import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/features/authentication/screens/forget_password/widgets/header_form.dart';
import 'package:flutter/material.dart';

class ForgetPasswordMobile extends StatelessWidget {
  const ForgetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: HeaderAndForm(),
      )),
    );
  }
}
