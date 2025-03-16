import 'package:data_table_2/data_table_2.dart';
import 'package:echo_admin_panel_flutter/common/widgets/data_tables/paginated.data_table.dart';
import 'package:flutter/material.dart';

import 'table_source.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return EPaginatedDataTable(
      minWidth: 700,
      columns: [
        DataColumn2(label: Text('Category ID')),
        DataColumn2(label: Text('Category Name')),
        DataColumn2(label: Text('Category Image')),
        DataColumn2(label: Text('Create Date')),
        DataColumn2(label: Text('Action')),
        
      ],
      source: CategoryRows(),
    );
  }
}
