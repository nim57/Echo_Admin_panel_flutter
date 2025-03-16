import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';
import 'responsive_screen/Item_Edit_desktop_Screen.dart';
import 'responsive_screen/Item_mobile_screen.dart';
import 'responsive_screen/Item_tablet_screen.dart';

class ItemEdit extends StatelessWidget {
  const ItemEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return ESiteTemplate(
      useLayout: false,
      desktop: ItemEditDesktopScreen(),
      tablet: ItemEditTabletScreen(),
      mobile: ItemEditMobileScreen(),
    );
  }
}