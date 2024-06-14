import 'package:bu_edmrs/common/widgets/header_container.dart';
import 'package:bu_edmrs/common/widgets/home_appbar.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class DataTableExample extends StatelessWidget {
  DataTableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContainer(
              child: Column(
                children: [
                  HomeAppBar(showBackArrow: true),
                  SizedBox(
                    width: 40,
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: DataTable2(
                        columnSpacing: 12,
                        horizontalMargin: 12,
                        minWidth: 600,
                        columns: [
                          DataColumn2(
                            label: Text('Column A'),
                            size: ColumnSize.L,
                          ),
                          DataColumn(
                            label: Text('Column B'),
                          ),
                          DataColumn(
                            label: Text('Column C'),
                          ),
                          DataColumn(
                            label: Text('Column D'),
                          ),
                          DataColumn(
                            label: Text('Column NUMBERS'),
                            numeric: true,
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          100,
                          (index) => DataRow(
                            cells: [
                              DataCell(Text('A' * (10 - index % 10))),
                              DataCell(Text('B' * (10 - (index + 5) % 10))),
                              DataCell(Text('C' * (15 - (index + 5) % 10))),
                              DataCell(Text('D' * (15 - (index + 10) % 10))),
                              DataCell(Text(((index + 0.1) * 25.4).toString()))
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
