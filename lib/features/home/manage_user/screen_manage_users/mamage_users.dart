import 'package:echo_admin_panel_flutter/common/widgets/layouts/templates/site_layout.dart';
import 'package:echo_admin_panel_flutter/features/home/manage_user/screen_manage_users/responsive_screen/Manage_user_mobile_screen.dart';
import 'package:echo_admin_panel_flutter/features/home/manage_user/screen_manage_users/responsive_screen/Manage_user_tablet_screen.dart';
import 'package:flutter/material.dart';

import 'responsive_screen/Manage_user_desktop_Screen.dart';

class UserMAnageScreen extends StatelessWidget {
  const UserMAnageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ESiteTemplate(useLayout: false, desktop: UserManageDesktopScreen(), tablet: ManageUserTabletScreen(), mobile: ManageUserMobileScreen(),);
  }
}