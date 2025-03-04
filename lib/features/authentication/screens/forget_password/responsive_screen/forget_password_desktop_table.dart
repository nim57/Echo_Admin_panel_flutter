import 'package:echo_admin_panel_flutter/common/widgets/layouts/templates/login_template.dart';
import 'package:flutter/material.dart';

import '../widgets/header_form.dart';

class ForgetPasswordDesktopTable extends StatelessWidget {
  const ForgetPasswordDesktopTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ELoginTemplate(
      child: HeaderAndForm()
    );
  }
}
