import 'package:echo_admin_panel_flutter/features/authentication/screens/login/responcive_screen/login_desktop_table.dart';
import 'package:echo_admin_panel_flutter/features/authentication/screens/login/responcive_screen/login_mobile.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ESiteTemplate(
      useLayout: true,
      desktop: LoginDesktopTable(),
      mobile: LoginScreenMobile(),
    );
  }
}
