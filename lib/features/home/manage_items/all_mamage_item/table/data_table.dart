import 'package:data_table_2/data_table_2.dart';
import 'package:echo_admin_panel_flutter/common/widgets/data_tables/paginated.data_table.dart';
import 'package:flutter/material.dart';

import 'table_source.dart';

class ManageItemTable extends StatelessWidget {
  const ManageItemTable({super.key});

  @override
  Widget build(BuildContext context) {
    return EPaginatedDataTable(
      minWidth: 700,
      columns: [
        DataColumn2(label: Text('Item ID')),
        DataColumn2(label: Text('Cat_ID')),
        DataColumn2(label: Text('Item Name')),
        DataColumn(label: Text('# Tags')),
        DataColumn2(label: Text('Discription')),
        DataColumn2(label: Text('Email')),
        DataColumn2(label: Text('Web Site')),
        DataColumn2(label: Text('Phone Number')),
        DataColumn2(label: Text('Map Loaction')),
        DataColumn2(label: Text('Profile Image')),
        DataColumn2(label: Text('Branch Have or Not')),
        DataColumn2(label: Text('Acount Create Date')),
        DataColumn2(label: Text('Action')),
      ],
      source: MamageItemRows(),
    );
  }
}
