import 'package:echo_admin_panel_flutter/features/home/notifications/created_notification/responsive_screen/notification_Add_desktop_Screen.dart';
import 'package:echo_admin_panel_flutter/features/home/notifications/created_notification/responsive_screen/notification_mobile_screen.dart';
import 'package:echo_admin_panel_flutter/features/home/notifications/created_notification/responsive_screen/notification_tablet_screen.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';

class NotificationAdd extends StatelessWidget {
  const NotificationAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return ESiteTemplate(
      useLayout: false,
      desktop: NotificationAddDesktopScreen(),
      tablet: NotificationAddTabletScreen(),
      mobile: NotificationAddMobileScreen(),
    );
  }
}