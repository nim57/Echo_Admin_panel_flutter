import 'package:echo_admin_panel_flutter/features/home/category/all_category/responsive_screen/Category_mobile_screen.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';
import 'responsive_screen/Edit_Category_tablet_screen.dart';
import 'responsive_screen/Edit_category_desktop_Screen.dart';
import 'responsive_screen/Edit_category_mobile_screen.dart';

class EditCategortScreen extends StatelessWidget {
  const EditCategortScreen({super.key, required String categoryId});

  @override
  Widget build(BuildContext context) {
    final category = CategoryMobileScreen();
    return ESiteTemplate(
      desktop: EditCategoryDesktopScreen(
        //category: category,
      ),
      tablet: EditCategoryTabletScreen(),
      mobile: EditCategoryMobileScreen(),
      useLayout: false,
    );
  }
}
