import 'package:echo_admin_panel_flutter/common/widgets/layouts/templates/site_layout.dart';
import 'package:echo_admin_panel_flutter/features/home/category/create_categort/responsive_screen/Create_Category_tablet_screen.dart';
import 'package:echo_admin_panel_flutter/features/home/category/create_categort/responsive_screen/Create_category_mobile_screen.dart';
import 'package:echo_admin_panel_flutter/features/home/category/create_categort/responsive_screen/Createcategory_desktop_Screen.dart';
import 'package:flutter/material.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ESiteTemplate(
      desktop: CreateCategoryDesktopScreen(),
      tablet: CreateCategoryTabletScreen(),
      mobile: CreateCategoryMobileScreen(),
      useLayout: false,
    );
  }
}
