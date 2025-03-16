import 'package:data_table_2/data_table_2.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/colors.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/common/widgets/layouts/headers/i_rounded_image.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../category/all_category/table/Table_action_icon_button.dart';
import '../widgets/pending_table_button.dart';

class PendingItemRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      DataCell(
        // ID
        Expanded(
          child: Text(
            "Item ID",
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: EColor.primaryColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        // Name
        Expanded(
          child: Text(
            "Cat_ID",
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: EColor.primaryColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        // Name
        Expanded(
          child: Text(
            "Item Name",
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: EColor.primaryColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        // Name
        Expanded(
          child: Text(
            "# Tags",
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: EColor.primaryColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        // Name
        Expanded(
          child: Text(
            "Discription",
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: EColor.primaryColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        // Name
        Expanded(
          child: Text(
            "Email",
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: EColor.primaryColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        // Name
        Expanded(
          child: Text(
            "Web Site",
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: EColor.primaryColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        // Name
        Expanded(
          child: Text(
            "Phone Number",
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: EColor.primaryColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        // Name
        Expanded(
          child: Text(
            "Map Loaction",
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: EColor.primaryColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(
        Row(
          children: [
            /// Image(logo)
            ERoundeImage(
              width: 50,
              height: 50,
              padding: ESizes.sm,
              image: EImages.user1,
              imageType: ImageType.network,
              borderRadus: ESizes.borderRadiusMd,
              backgroundColor: EColor.primaryBackground,
            ),

            const SizedBox(
              width: ESizes.spaceBtwItems,
            ),

            // Name
            Expanded(
              child: Text(
                "Name",
                style: Theme.of(Get.context!)
                    .textTheme
                    .bodyLarge!
                    .apply(color: EColor.primaryColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      DataCell(
        // Name
        Expanded(
          child: Text(
            "Branch Have or Not",
            style: Theme.of(Get.context!)
                .textTheme
                .bodyLarge!
                .apply(color: EColor.primaryColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(Text(DateTime.now().toString())),
      DataCell(
        PendingActionButton(
        onDeletePressed: () {},
        onacceptPressed: () {},
      )),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 15;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
