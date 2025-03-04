import 'package:flutter/material.dart';

import '../../../Utils/constants/colors.dart';
import '../../../Utils/constants/sizes.dart';
import '../../../Utils/helpers/helper_function.dart';

class TcircularIcon extends StatelessWidget {
  /// A customer
  ///
  /// properties
  /// container
  ///
  /// Icon's
  const TcircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = ESizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : EHelperFunctions.isDarkMode(context)
                ? EColor.black.withOpacity(0.9)
                : EColor.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
