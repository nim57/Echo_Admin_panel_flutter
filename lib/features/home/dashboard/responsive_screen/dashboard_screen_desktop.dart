import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/common/widgets/containers/rounded_container.dart';
import 'package:echo_admin_panel_flutter/features/home/dashboard/widgets/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/dashboard_cart.dart';

class DashboardScreenDesktop extends StatelessWidget {
  const DashboardScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 208, 208),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Center(
            child: Column(
              children: [
                /// Header
                Text('Dashboard',
                    style: Theme.of(context).textTheme.headlineLarge),
                SizedBox(height: ESizes.spaceBtwSections),

                // Cart
                Row(
                  children: [
                    Expanded(
                      child: EDashBoardCart(
                        stats: 25,
                        title: 'Total Review',
                        subTitle: '2345',
                      ),
                    ),
                    SizedBox(
                      width: ESizes.spaceBtwItems,
                    ),
                    Expanded(
                      child: EDashBoardCart(
                        stats: 25,
                        title: 'Total Review',
                        subTitle: '2345',
                      ),
                    ),
                    SizedBox(
                      width: ESizes.spaceBtwItems,
                    ),
                    Expanded(
                      child: EDashBoardCart(
                        stats: 25,
                        title: 'Total Review',
                        subTitle: '2345',
                      ),
                    ),
                    SizedBox(
                      width: ESizes.spaceBtwItems,
                    ),
                  ],
                ),

                /// Graphs
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          /// Bar Graph
                          ERoundedContainer(),

                          SizedBox(height: ESizes.spaceBtwSections),

                          /// Rivew Graph
                          ERoundedContainer(),
                        ],
                      ),
                    ),
                    SizedBox(width: ESizes.spaceBtwSections),
                    Expanded(
                      child: ERoundedContainer(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
