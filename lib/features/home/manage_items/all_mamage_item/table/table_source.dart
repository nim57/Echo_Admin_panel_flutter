import 'package:data_table_2/data_table_2.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/colors.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/common/widgets/layouts/headers/i_rounded_image.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../category/all_category/table/Table_action_icon_button.dart';
import '../../add Item/backend/item_controller.dart';

class ItemTableSource extends DataTableSource {
  final ItemController _controller = Get.find();
  late final Worker _itemsWorker;

  ItemTableSource() {
    _itemsWorker = ever(
      _controller.items,
      (_) => notifyListeners(),
    );
  }

  @override
  DataRow? getRow(int index) {
    final item = _controller.items[index];
    final dateFormat = DateFormat('dd MMM yyyy HH:mm');

    return DataRow2(
      cells: [
        DataCell(_buildCellText(item.id)),
        DataCell(_buildCellText(item.categoryId)),
        DataCell(_buildCellText(item.name)),
        DataCell(_buildCellText(item.tags)),
        DataCell(_buildCellText(item.description)),
        DataCell(_buildCellText(item.email)),
        DataCell(_buildCellText(item.website)),
        DataCell(_buildCellText(item.phoneNumber)),
        DataCell(
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () => _openMap(item.mapLocation),
          ),
        ),
        DataCell(
          ERoundeImage(
            width: 50,
            height: 50,
            image: item.profileImage.isNotEmpty
                ? item.profileImage
                : EImages.user1,
            imageType: ImageType.network,
          ),
        ),
        DataCell(_buildCellText(item.hasBranch ? 'Yes' : 'No')),
        DataCell(_buildCellText(dateFormat.format(item.createdAt))),
        DataCell(
          ETableActionButton(
            onEditPressed: () => Get.toNamed(
              ERoutes.editItem,
              arguments: item.id,
            ),
            onDeletePressed: () => _confirmDelete(item.id),
          ),
        ),
      ],
    );
  }

  Widget _buildCellText(dynamic text) {
    return Text(
      text.toString(),
      style: Theme.of(Get.context!)
          .textTheme
          .bodyLarge!
          .apply(color: EColor.primaryColor),
    );
  }

  void _openMap(String location) {
    // Implement map opening logic
  }

  void _confirmDelete(String itemId) {
    Get.defaultDialog(
      title: 'Confirm Delete',
      content: Text('Are you sure you want to delete this item?'),
      confirm: ElevatedButton(
        onPressed: () {
          _controller.deleteItem(itemId);
          Get.back();
        },
        child: Text('Delete'),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text('Cancel'),
      ),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _controller.items.length;

  @override
  int get selectedRowCount => 0;

  @override
  void dispose() {
    _itemsWorker.dispose();
    super.dispose();
  }
}
