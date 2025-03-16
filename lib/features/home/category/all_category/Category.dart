import 'package:echo_admin_panel_flutter/common/widgets/layouts/templates/site_layout.dart';
import 'package:echo_admin_panel_flutter/features/home/category/all_category/responsive_screen/Category_tablet_screen.dart';
import 'package:flutter/material.dart';

import 'responsive_screen/category_desktop_Screen.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ESiteTemplate(useLayout: false, desktop: CategoryDesktopScreen(), tablet: CategoryTabletScreen(), mobile: CategoryTabletScreen());
  }
}