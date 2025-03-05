import 'package:echo_admin_panel_flutter/common/widgets/layouts/headers/header.dart';
import 'package:flutter/material.dart';

import '../../layouts/sidebar/sidebar.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ESidebar(),
      appBar: EHeader(),
      body: body ?? const SizedBox(),
    );
  }
}
