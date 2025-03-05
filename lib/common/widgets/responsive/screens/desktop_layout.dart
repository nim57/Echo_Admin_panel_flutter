import 'package:echo_admin_panel_flutter/common/widgets/layouts/sidebar/sidebar.dart';
import 'package:flutter/material.dart';

import '../../layouts/headers/header.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;

  //final GlobalKey<ScaffoldState> scafofoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: scafofoldKey,
      body: Row(
        children: [
          Expanded(child: ESidebar()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // Header
                const EHeader(),
                //body
                Expanded(child: body ?? const SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
