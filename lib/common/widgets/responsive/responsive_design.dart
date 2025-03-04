import 'package:flutter/material.dart';

import '../../../Utils/constants/sizes.dart';

class EResponsiveWidget extends StatelessWidget {
  const EResponsiveWidget(
      {super.key,
      required this.desktop,
      required this.tablet,
      required this.mobile});

  /// Widget for desktop layout
  final Widget desktop;

  /// Widget for tablet layout
  final Widget tablet;

  /// Widget for mobile layout
  final Widget mobile;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      if (constraints.maxWidth >= ESizes.desktopScreenSize) {
        return desktop;
      } else if (constraints.maxWidth < ESizes.desktopScreenSize &&
          constraints.maxWidth >= ESizes.tabletScreenSize) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
