import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../widgets/dashboard_cart.dart';

class DashboardTabScreen extends StatelessWidget {
  const DashboardTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
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
                ],
              ),
              SizedBox(
                height: ESizes.spaceBtwItems,
              ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
