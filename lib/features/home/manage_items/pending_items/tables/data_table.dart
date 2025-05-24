// pending_item_table.dart
import 'package:data_table_2/data_table_2.dart';
import 'package:echo_admin_panel_flutter/common/widgets/data_tables/paginated.data_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../backend/pending_item_controller.dart';
import 'table_source.dart';

class PendingItemTable extends StatelessWidget {
  final PendingItemController controller = Get.put(PendingItemController());

  PendingItemTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      
      return EPaginatedDataTable(
        minWidth: 700,
        columns: const [
          DataColumn2(label: Text('Item ID')),
          DataColumn2(label: Text('Category ID')),
          DataColumn2(label: Text('Item Name')),
          DataColumn(label: Text('# Tags')),
          DataColumn2(label: Text('Description')),
          DataColumn2(label: Text('Email')),
          DataColumn2(label: Text('Website')),
          DataColumn2(label: Text('Phone')),
          DataColumn2(label: Text('Map Location')),
          DataColumn2(label: Text('Profile Image')),
          DataColumn2(label: Text('Has Branch')),
          DataColumn2(label: Text('Created At')),
          DataColumn2(label: Text('Action'), fixedWidth: 135),
        ],
        source: PendingItemRows(controller.pendingItems, controller),
      );
    });
  }
}