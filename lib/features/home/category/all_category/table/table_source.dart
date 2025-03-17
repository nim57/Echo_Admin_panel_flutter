import 'package:data_table_2/data_table_2.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/colors.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/common/widgets/layouts/headers/i_rounded_image.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../create_categort/cload_cods/category_controller.dart';
import 'Table_action_icon_button.dart';

class CategoryTableSource extends DataTableSource {
  final CategoryController _controller = Get.find();
  late final Worker _categoriesWorker;

  CategoryTableSource() {
    _categoriesWorker = ever(
      _controller.categories,
      (_) => notifyListeners(),
    );
  }

  @override
  DataRow? getRow(int index) {
    final category = _controller.categories[index];
    final dateFormat = DateFormat('dd MMM yyyy HH:mm');

    return DataRow2(
      cells: [
        DataCell(_buildCellText(category.id)),
        DataCell(_buildCellText(category.name)),
        DataCell(
          ERoundeImage(
            width: 50,
            height: 50,
            image: category.log.isNotEmpty ? category.log : EImages.user1,
            imageType: ImageType.network,
          ),
        ),
        DataCell(Text(DateTime.now().toString())),
        DataCell(
          ETableActionButton(
            onEditPressed: () =>
                Get.toNamed(ERoutes.editCategory, arguments: category.id),
            onDeletePressed: () => _controller.deleteCategory(category.id),
          ),
        ),
      ],
    );
  }

  Widget _buildCellText(String text) {
    return Text(
      text,
      style: Theme.of(Get.context!)
          .textTheme
          .bodyLarge!
          .apply(color: EColor.primaryColor),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _controller.categories.length;

  @override
  int get selectedRowCount => 0;

  @override
  void dispose() {
    _categoriesWorker.dispose();
    super.dispose();
  }
}
