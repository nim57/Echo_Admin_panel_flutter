import 'package:echo_admin_panel_flutter/Utils/constants/colors.dart';
import 'package:echo_admin_panel_flutter/features/home/dashboard/widgets/ESection_heading.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Utils/constants/sizes.dart';
import '../../../../common/widgets/containers/rounded_container.dart';

class EDashBoardCart extends StatelessWidget {
  const EDashBoardCart({
    super.key,
    required this.title,
    required this.subTitle,
    this.icon = Iconsax.arrow_up3,
    this.color = EColor.success,
    required this.stats,
    this.onTap,
  });

  final String title, subTitle;
  final IconData icon;
  final Color color;
  final int stats;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ERoundedContainer(
      onTap: onTap,
      padding: EdgeInsets.all(ESizes.lg),
      child: Column(
        children: [
          /// Heading
          ESectionHeading(
            title: title,
            textColor: EColor.textSecondary,
          ),
          SizedBox(
            height: ESizes.spaceBtwSections,
          ),

          Row(
            children: [
              Text(subTitle, style: Theme.of(context).textTheme.headlineMedium),

              /// Right Side Stats
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(
                          icon,
                          color: EColor.success,
                          size: ESizes.iconSm,
                        ),
                        Text(
                          '$stats%',
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                              color: color, overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 135,
                    child: Text(
                      'Compared to Dec 2025',
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
