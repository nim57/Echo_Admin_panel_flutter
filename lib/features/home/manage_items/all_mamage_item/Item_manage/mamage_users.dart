import 'package:echo_admin_panel_flutter/common/widgets/layouts/templates/site_layout.dart';
import 'package:echo_admin_panel_flutter/features/home/manage_user/screen_manage_users/responsive_screen/Manage_user_mobile_screen.dart';
import 'package:echo_admin_panel_flutter/features/home/manage_user/screen_manage_users/responsive_screen/Manage_user_tablet_screen.dart';
import 'package:flutter/material.dart';

import 'responsive_screen/Item_desktop_Screen.dart';
import 'responsive_screen/Item_mobile_screen.dart';
import 'responsive_screen/Item_tablet_screen.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ESiteTemplate(
      useLayout: false,
      desktop: ItemDesktopScreen(),
      tablet: ItemTabletScreen(),
      mobile: ItemMobileScreen(),
    );
  }
}
