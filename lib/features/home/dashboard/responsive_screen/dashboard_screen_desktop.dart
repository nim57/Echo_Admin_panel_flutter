import 'package:flutter/material.dart';

class DashboardScreenDesktop extends StatelessWidget {
  const DashboardScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
            child: Table(border: TableBorder.all(), children: [
          TableRow(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.greenAccent, width: 2)),
              children: [
                TableCell(child: Text('Cell 1')),
                TableCell(child: Text('Cell 1')),
              ]),
          TableRow(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.greenAccent, width: 2)),
              children: [
                TableCell(child: Text('Cell 1')),
                TableCell(child: Text('Cell 1')),
              ]),
        ])),
      ),
    );
  }
}
