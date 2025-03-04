import 'package:echo_admin_panel_flutter/common/widgets/layouts/templates/login_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/reset_password_widgets.dart';

class ResetPasswordScreenDesktop extends StatelessWidget {
  const ResetPasswordScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final email = Get.parameters['email'] ?? '';
    return ELoginTemplate(
      child: ResetPasswordWidget(),
    );
  }
}
