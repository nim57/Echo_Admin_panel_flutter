import 'package:echo_admin_panel_flutter/common/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Drawer()),
          Expanded(
            child: Column(
              children: [
                // Header
                ERoundedContainer(
                  width: double.infinity,
                  height: 75,
                  backgroundColor: Colors.blue.withOpacity(0.2),
                ),

                //body
                body ?? const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
