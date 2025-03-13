import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class ERoundedContainer extends StatelessWidget {
  const ERoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.redius = ESizes.cordRadiusLg,
      this.child,
      this.showBoarder = false,
      this.boaderColor = const Color.fromARGB(255, 0, 0, 0),
      this.backgroundColor = const Color.fromARGB(255, 246, 245, 245),
      this.padding,
      this.margin,
      this.onTap});

  final double? width;
  final double? height;
  final double redius;
  final Widget? child;
  final bool showBoarder;
  final Color boaderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(redius),
          border: showBoarder ? Border.all(color: boaderColor) : null,
        ),
        child: child,
      ),
    );
  }
}
