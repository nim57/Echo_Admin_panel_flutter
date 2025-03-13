import 'package:data_table_2/data_table_2.dart';
import 'package:echo_admin_panel_flutter/Utils/constants/image_Strings.dart';
import 'package:echo_admin_panel_flutter/common/widgets/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Utils/constants/colors.dart';
import '../../../Utils/constants/sizes.dart';

class EPaginatedDataTable extends StatelessWidget {
  const EPaginatedDataTable({
    super.key,
    this.sortAscending = true,
    this.sortColumnIndex,
    this.rowsPerPage = 10,
    required this.source,
    required this.columns,
    this.onPerPageChanged,
    this.dataRowHeight = ESizes.xl * 2,
    this.tableHeight = 760,
    this.minWidth = 1000,
  });

  final bool sortAscending;
  final int? sortColumnIndex;
  final int rowsPerPage;
  final DataTableSource source;
  final List<DataColumn> columns;
  final Function(int)? onPerPageChanged;
  final double dataRowHeight;
  final double tableHeight;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 760,
      child: Theme(
        // Use to set the Backend color
        data: Theme.of(context).copyWith(
            cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
        )),
        child: PaginatedDataTable2(
          source: source,
          columns: columns,
          columnSpacing: 12,
          minWidth: minWidth,
          dividerThickness: 0,
          horizontalMargin: 12,
          showFirstLastButtons: true,
          dataRowHeight: dataRowHeight,
          rowsPerPage: rowsPerPage,
          showCheckboxColumn: true,

          //Pagination

          onPageChanged: onPerPageChanged,
          renderEmptyRowsInTheEnd: false,
          onRowsPerPageChanged: (noofRows) {},

          headingTextStyle: Theme.of(context).textTheme.titleMedium,
          headingRowColor: WidgetStateColor.resolveWith(
            (states) => EColor.primaryBackground,
          ),
          headingRowDecoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ESizes.borderRadiusMd),
              topRight: Radius.circular(ESizes.borderRadiusMd),
            ),
          ),

          empty: EAnimationLoaderWidget(
            text: 'Nothing FOund',
            height: 100,
            width: 100,
            animation: EImages.E,
          ),

          // Sorting

          sortAscending: sortAscending,
          sortArrowAlwaysVisible: true,
          sortArrowIcon: Icons.line_axis,
          sortColumnIndex: sortColumnIndex,
          sortArrowBuilder: (bool ascending, bool sorted) {
            if (sorted) {
              return Icon(
                ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down,
                size: ESizes.iconSm,
              );
            } else {
              return Icon(
                Iconsax.arrow_3,
                size: ESizes.iconSm,
              );
            }
          },
        ),
      ),
    );
  }
}
