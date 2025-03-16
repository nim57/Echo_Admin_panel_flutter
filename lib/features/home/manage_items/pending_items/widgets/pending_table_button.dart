import 'package:echo_admin_panel_flutter/Utils/constants/colors.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PendingActionButton extends StatelessWidget {
  const PendingActionButton(
      {super.key,
      this.onDeletePressed,
      this.Accept = true,
      this.Delete = true,
      this.onacceptPressed});

  final bool Accept;
  final bool Delete;

  final VoidCallback? onacceptPressed;
  final VoidCallback? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (Accept)
          ElevatedButton(
            onPressed: onacceptPressed,
            child: Text(
              'Accept',
              style: TextStyle(fontSize: 10),
            ),
          ),
        SizedBox(
          width: ESizes.spaceBtwItems,
        ),
        if (Delete)
          ElevatedButton(
            onPressed: onDeletePressed,
            child: Text(
              'Delete',
              style: TextStyle(fontSize: 10),
            ),
          ),
      ],
    );
  }
}
