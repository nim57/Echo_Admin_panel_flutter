import 'package:echo_admin_panel_flutter/common/widgets/layouts/templates/site_layout.dart';
import 'package:echo_admin_panel_flutter/features/authentication/screens/forget_password/responsive_screen/forget_password_mobile.dart';
import 'package:flutter/material.dart';

import 'responsive_screen/forget_password_desktop_table.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ESiteTemplate(
      useLayout: false,
      desktop: ForgetPasswordDesktopTable(),
      mobile: ForgetPasswordMobile(),
    );
  }
}
