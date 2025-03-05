import 'package:echo_admin_panel_flutter/common/widgets/layouts/headers/header.dart';
import 'package:flutter/material.dart';

import '../../layouts/sidebar/sidebar.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ESidebar(),
      appBar: EHeader(),
      body: body ?? const SizedBox(),
    );
  }
}
