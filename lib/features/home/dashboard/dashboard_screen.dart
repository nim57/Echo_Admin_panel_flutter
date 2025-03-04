import 'package:echo_admin_panel_flutter/common/widgets/layouts/templates/site_layout.dart';
import 'package:echo_admin_panel_flutter/features/home/dashboard/responsive_screen/dashboard_screen_desktop.dart';
import 'package:echo_admin_panel_flutter/features/home/dashboard/responsive_screen/dashboard_screen_mobile.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ESiteTemplate(
      useLayout: false,
      desktop: DashboardScreenDesktop(),
      mobile: DashboardScreenMobile(),
    );
  }
}
