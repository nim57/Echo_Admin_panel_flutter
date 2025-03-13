import 'package:flutter/material.dart';

import '../../../../Utils/constants/sizes.dart';
import '../widgets/dashboard_cart.dart';

class DashboardScreenMobile extends StatelessWidget {
  const DashboardScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Text('Dashboard',
                  style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: ESizes.spaceBtwSections),

              // Cart
              EDashBoardCart(
                stats: 25,
                title: 'Total Review',
                subTitle: '2345',
              ),
              SizedBox(
                height: ESizes.spaceBtwItems,
              ),
              EDashBoardCart(
                stats: 25,
                title: 'Total Review',
                subTitle: '2345',
              ),
              SizedBox(
                height: ESizes.spaceBtwItems,
              ),
              SizedBox(
                height: ESizes.spaceBtwItems,
              ),
              // Cart
              EDashBoardCart(
                stats: 25,
                title: 'Total Review',
                subTitle: '2345',
              ),
              SizedBox(
                height: ESizes.spaceBtwItems,
              ),
              EDashBoardCart(
                stats: 25,
                title: 'Total Review',
                subTitle: '2345',
              ),
              SizedBox(
                height: ESizes.spaceBtwItems,
              ),
              EDashBoardCart(
                stats: 25,
                title: 'Total Review',
                subTitle: '2345',
              ),
              SizedBox(
                height: ESizes.spaceBtwItems,
              )
            ],
          ),
        ),
      ),
    );
  }
}
