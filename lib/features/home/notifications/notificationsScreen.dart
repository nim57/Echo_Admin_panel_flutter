import 'package:echo_admin_panel_flutter/common/widgets/layouts/templates/site_layout.dart';
import 'package:flutter/material.dart';

import 'responsive_Screens/notifications_desktop.dart';
import 'responsive_Screens/notifications_mobile.dart';
import 'responsive_Screens/notifications_tablet.dart';

class Notificationsscreen extends StatelessWidget {
  const Notificationsscreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return ESiteTemplate(
      useLayout: false,
      desktop: NotificationsDesktop(),
      tablet: NotificationsTablet(),
      mobile: NotificationsMobile(),
    );
  }
}
