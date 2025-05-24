// table_source.dart
import 'package:data_table_2/data_table_2.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/colors.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/common/widgets/layouts/headers/i_rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../backend/pending item_model.dart';
import '../backend/pending_item_controller.dart';
import '../widgets/pending_table_button.dart';

class PendingItemRows extends DataTableSource {
  final List<PendingItem> pendingItems;
  final PendingItemController controller;

  PendingItemRows(this.pendingItems, this.controller);

  @override
  DataRow? getRow(int index) {
    if (index >= pendingItems.length) return null;
    final item = pendingItems[index];
    
    return DataRow2(
      cells: [
        DataCell(Text(item.id)),
        DataCell(Text(item.categoryId)),
        DataCell(Text(item.name)),
        DataCell(Text(item.tags.length.toString())),
        DataCell(Text(item.description)),
        DataCell(Text(item.email)),
        DataCell(Text(item.website)),
        DataCell(Text(item.phone)),
        DataCell(Text(item.mapLocation)),
        DataCell(
          Row(
            children: [
              ERoundeImage(
                width: 50,
                height: 50,
                padding: ESizes.sm,
                image: item.imageUrl.isNotEmpty 
                    ? item.imageUrl 
                    : EImages.user1,
                imageType: item.imageUrl.isNotEmpty 
                    ? ImageType.network 
                    : ImageType.asset,
                borderRadus: ESizes.borderRadiusMd,
                backgroundColor: EColor.primaryBackground,
              ),
              const SizedBox(width: ESizes.spaceBtwItems),
              Expanded(
                child: Text(
                  item.name,
                  style: Get.textTheme.bodyLarge!
                      .apply(color: EColor.primaryColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        DataCell(Text(item.hasBranch ? 'Yes' : 'No')),
        DataCell(Text('${item.createdAt.day}/${item.createdAt.month}/${item.createdAt.year}')),
      DataCell(
  PendingActionButton(
    onDeletePressed: (message) => controller.rejectItem(
      item.id, 
      message,
      item.email, // Make sure PendingItem has email field
    ),
    onAcceptPressed: () => controller.approveItem(item),
  ),
),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => pendingItems.length;

  @override
  int get selectedRowCount => 0;
}