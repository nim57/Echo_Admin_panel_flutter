import 'package:echo_admin_panel_flutter/common/widgets/layouts/templates/site_layout.dart';
import 'package:echo_admin_panel_flutter/features/home/mamage_post/responsive_Screens/mamage_post_desktop.dart';
import 'package:echo_admin_panel_flutter/features/home/mamage_post/responsive_Screens/manage_post_mobile.dart';
import 'package:echo_admin_panel_flutter/features/home/mamage_post/responsive_Screens/manage_post_tablet.dart';
import 'package:flutter/material.dart';

class ManagePostScreen extends StatelessWidget {
  const ManagePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ESiteTemplate(
      useLayout: false,
      desktop: ManagePostDesktop(),
      tablet: ManagePostTablet(),
      mobile: ManagePostMobile(),
    );
  }
}
