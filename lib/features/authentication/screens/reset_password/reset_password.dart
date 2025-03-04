import 'package:echo_admin_panel_flutter/common/widgets/layouts/templates/site_layout.dart';
import 'package:echo_admin_panel_flutter/features/authentication/screens/reset_password/responsive_screen/reser_passwprd_modile.dart';
import 'package:flutter/material.dart';

import 'responsive_screen/reset_password_desktop.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ESiteTemplate(
      useLayout: false,
      desktop: ResetPasswordScreenDesktop(),
      mobile: ResetPasswordScreenMobile(),
    );
  }
}
