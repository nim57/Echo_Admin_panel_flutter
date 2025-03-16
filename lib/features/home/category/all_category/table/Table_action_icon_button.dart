import 'package:echo_admin_panel_flutter/Utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ETableActionButton extends StatelessWidget {
  const ETableActionButton(
      {super.key,
      this.view = false,
      this.edit = true,
      this.delete = true,
      this.onViewPressed,
      this.onEditPressed,
      this.onDeletePressed});

  final bool view;
  final bool edit;
  final bool delete;

  final VoidCallback? onViewPressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (view)
          IconButton(
            onPressed: onViewPressed,
            icon: const Icon(
              Iconsax.eye,
              color: EColor.darkGrey,
            ),
          ),
        if (edit)
          IconButton(
            onPressed: onEditPressed,
            icon: const Icon(
              Iconsax.pen_add,
              color: EColor.primaryColor,
            ),
          ),
        if (delete)
          IconButton(
            onPressed: onDeletePressed,
            icon: const Icon(
              Iconsax.trash,
              color: EColor.error,
            ),
          ),
      ],
    );
  }
}
