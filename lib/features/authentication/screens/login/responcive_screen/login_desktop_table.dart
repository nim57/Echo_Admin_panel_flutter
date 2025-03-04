import 'package:echo_admin_panel_flutter/common/widgets/layouts/templates/login_template.dart';
import 'package:flutter/material.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginDesktopTable extends StatelessWidget {
  const LoginDesktopTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ELoginTemplate(
      child: Column(
        children: [
          // Header
          ELoginHeader(context),

          // Form
          ELoginForm()
        ],
      ),
    );
  }
}
