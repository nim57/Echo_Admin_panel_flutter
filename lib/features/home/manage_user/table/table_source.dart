import 'package:data_table_2/data_table_2.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/colors.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/sizes.dart';
import 'package:echo_admin_panel_flutter/common/widgets/layouts/headers/i_rounded_image.dart';
import 'package:echo_admin_panel_flutter/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../category/all_category/table/Table_action_icon_button.dart';

class MamageUsersRows extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      DataCell(
        // ID
        Expanded(
          child: Text(
            "User ID",
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
            "First Name",
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
            "Last Name",
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
            "Username",
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
      DataCell(Text(DateTime.now().toString())),
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
      DataCell(ETableActionButton(
        delete: true,
        edit: false,
        view: false,
        onDeletePressed: () {},
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
