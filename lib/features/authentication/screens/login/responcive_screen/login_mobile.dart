import 'package:echo_admin_panel_flutter/features/authentication/screens/login/widgets/login_form.dart';
import 'package:echo_admin_panel_flutter/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';

import '../../../../../Utils/constants/sizes.dart';

class LoginScreenMobile extends StatelessWidget {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              // Header
              ELoginHeader(context),

              // Form
              ELoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
