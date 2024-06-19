import 'package:clean_a/branch_M/data/models/branch_list_data.dart';
import 'package:flutter/material.dart';

class BranchListWidget extends StatelessWidget {
  final List<BranchListData> data;

  const BranchListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        double padding = isTablet ? 46.0 : 16.0;

        return Padding(
          padding: EdgeInsets.all(padding),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Branch List',
                  style: TextStyle(fontSize: isTablet ? 23 : 20),
                ),
                Text(
                  'View and Edit Branches',
                  style: TextStyle(fontSize: isTablet ? 23 : 20),
                ),
                SizedBox(height: isTablet ? 40 : 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor:
                              const Color.fromARGB(236, 27, 228, 4),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.add,
                                color: Colors.white, size: isTablet ? 17 : 15),
                            SizedBox(width: isTablet ? 17 : 10),
                            const Text('Add Items',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(width: isTablet ? 40 : 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor:
                              const Color.fromRGBO(33, 150, 243, 1),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.format_line_spacing_sharp,
                                color: Colors.black, size: isTablet ? 17 : 15),
                            SizedBox(width: isTablet ? 17 : 10),
                            const Text('Filter By',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(width: isTablet ? 40 : 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 230, 79, 68),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.delete,
                                color: Colors.white, size: isTablet ? 17 : 15),
                            SizedBox(width: isTablet ? 17 : 10),
                            const Text('Delete Items',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: isTablet ? 40 : 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    columnWidths: {
                      0: FixedColumnWidth(isTablet ? 150 : 120),
                      1: FixedColumnWidth(isTablet ? 150 : 120),
                      2: FixedColumnWidth(isTablet ? 150 : 120),
                      3: FixedColumnWidth(isTablet ? 150 : 120),
                      4: FixedColumnWidth(isTablet ? 150 : 120),
                    },
                    children: [
                      _buildHeaderRow(isTablet),
                      ...data
                          .map((item) => _buildDataRow(item, isTablet))
                          .toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TableRow _buildHeaderRow(bool isTablet) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      children: [
        _buildHeaderCell('Branch ID', isTablet),
        _buildHeaderCell('Name', isTablet),
        _buildHeaderCell('Manager', isTablet),
        _buildHeaderCell('Address', isTablet),
        _buildHeaderCell('Email', isTablet),
      ],
    );
  }

  TableRow _buildDataRow(BranchListData data, bool isTablet) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      children: [
        _buildDataCell(data.branchId, isTablet),
        _buildDataCell(data.name, isTablet),
        _buildDataCell(data.branchManager, isTablet),
        _buildDataCell(data.address, isTablet),
        _buildDataCell(data.email, isTablet),
      ],
    );
  }

  Widget _buildHeaderCell(String text, bool isTablet) {
    return Padding(
      padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, bool isTablet) {
    return Padding(
      padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
