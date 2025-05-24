import 'package:data_table_2/data_table_2.dart';
import 'package:echo_admin_panel_flutter/common/widgets/data_tables/paginated.data_table.dart';
import 'package:flutter/material.dart';

import 'table_source.dart';

class MamagePostTable extends StatelessWidget {
  const MamagePostTable({super.key});

  @override
  Widget build(BuildContext context) {
    return EPaginatedDataTable(
      minWidth: 700,
      columns: [
        DataColumn2(label: Text('Post ID')),
        DataColumn2(label: Text('User ID')),
        DataColumn2(label: Text('Post Type')),
        DataColumn(label: Text('Username')),
        DataColumn2(label: Text('# tags')),
        DataColumn2(label: Text('Title')),
        DataColumn2(label: Text('Profile Visibility')),
        DataColumn2(label: Text('Acount Create Date')),
        DataColumn2(label: Text('Profile Image')),
        DataColumn2(label: Text('Action')),
      ],
      source: MamagePostRows(),
    );
  }
}
