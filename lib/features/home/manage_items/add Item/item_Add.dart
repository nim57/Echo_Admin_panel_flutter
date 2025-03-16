import 'package:echo_admin_panel_flutter/features/home/manage_items/add%20Item/responsive_screen/Item_Add_desktop_Screen.dart';
import 'package:echo_admin_panel_flutter/features/home/manage_items/add%20Item/responsive_screen/Item_mobile_screen.dart';
import 'package:echo_admin_panel_flutter/features/home/manage_items/add%20Item/responsive_screen/Item_tablet_screen.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';

class ItemAdd extends StatelessWidget {
  const ItemAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return ESiteTemplate(
      useLayout: false,
      desktop: ItemAddDesktopScreen(),
      tablet: ItemAddTabletScreen(),
      mobile: ItemAddMobileScreen(),
    );
  }
}