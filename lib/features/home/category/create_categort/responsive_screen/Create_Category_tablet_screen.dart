import 'package:flutter/material.dart';

import '../../../../../Utils/constants/sizes.dart';
import '../../../../../routes/route.dart';
import '../../../dashboard/widgets/breadcrumb_with_heading.dart';
import '../widgets/create_category_form.dart';

class CreateCategoryTabletScreen extends StatelessWidget {
  const CreateCategoryTabletScreen({super.key});

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
