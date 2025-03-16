import 'package:echo_admin_panel_flutter/features/home/manage_items/pending_items/responsive_screen/peing_item_mobile.dart';
import 'package:echo_admin_panel_flutter/features/home/manage_items/pending_items/responsive_screen/pending_item_desktop.dart';
import 'package:echo_admin_panel_flutter/features/home/manage_items/pending_items/responsive_screen/pending_item_tablet.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';

class PendingItemScreen extends StatelessWidget {
  const PendingItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ESiteTemplate(
      useLayout: false,
      desktop: PendingItemDesktop(),
      tablet: PendingItemTablet(),
      mobile: PeingItemMobile(),
    );
  }
}
