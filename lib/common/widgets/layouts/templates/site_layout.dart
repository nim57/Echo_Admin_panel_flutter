import 'package:flutter/material.dart';

import '../../responsive/responsive_design.dart';
import '../../responsive/screens/desktop_layout.dart';
import '../../responsive/screens/mobile_layout.dart';
import '../../responsive/screens/tablet_layout.dart';

class ESiteTemplate extends StatelessWidget {
  const ESiteTemplate(
      {super.key,
      this.desktop,
      this.tablet,
      this.mobile,
      this.useLAyout = true,
      required bool useLayout});

  /// widget for desktop layout
  final Widget? desktop;

  /// widget for tablet layout
  final Widget? tablet;

  /// widget for mobile layout
  final Widget? mobile;

  /// Flag to determine whether to use layout
  final bool useLAyout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EResponsiveWidget(
        desktop:
            useLAyout ? DesktopLayout(body: desktop) : desktop ?? Container(),
        tablet: useLAyout
            ? TabletLayout(body: tablet ?? desktop)
            : tablet ?? desktop ?? Container(),
        mobile: useLAyout
            ? MobileLayout(body: mobile ?? desktop)
            : mobile ?? desktop ?? Container(),
      ),
    );
  }
}
