import 'package:data_table_2/data_table_2.dart';
import 'package:echo_admin_panel_flutter/common/widgets/data_tables/paginated.data_table.dart';
import 'package:flutter/material.dart';

import 'table_source.dart';

class MamageUserTable extends StatelessWidget {
  const MamageUserTable({super.key});

  @override
  Widget build(BuildContext context) {
    return EPaginatedDataTable(
      minWidth: 700,
      columns: [
        DataColumn2(label: Text('User ID')),
        DataColumn2(label: Text(' First Name')),
        DataColumn2(label: Text('Last Name')),
        DataColumn(label: Text('Username')),
        DataColumn2(label: Text('Email')),
        DataColumn2(label: Text('Phone Number')),
        DataColumn2(label: Text('Acount Create Date')),
        DataColumn2(label: Text('Profile Image')),
        DataColumn2(label: Text('Action')),
      ],
      source: MamageUsersRows(),
    );
  }
}
