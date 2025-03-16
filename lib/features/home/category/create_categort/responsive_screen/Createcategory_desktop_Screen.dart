import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/features/home/dashboard/widgets/breadcrumb_with_heading.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:flutter/material.dart';

import '../widgets/create_category_form.dart';

class CreateCategoryDesktopScreen extends StatelessWidget {
  const CreateCategoryDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// BreadCrumbs
            EBreadcrumbsWithHeading(
                heading: 'Create Category',
                breadcrumbItems: [ERoutes.category, 'Create Category'],
                returnToPreviousScreen: true),
            SizedBox(
              height: ESizes.spaceBtwSections,
            ),

            /// Form
            CreateCategoryForm(),
          ],
        ),
      ),
    );
  }
}
