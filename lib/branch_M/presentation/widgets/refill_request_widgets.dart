import 'package:flutter/material.dart';
import 'package:clean_a/branch_M/data/models/refill_request_data.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';

class RefillRequestContent extends StatelessWidget {
  const RefillRequestContent({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      RefillRequestData(
        branchId: '01',
        name: 'johannes Dereje',
        request: 'abel',
        date: '20/13/23',
        requestedBy: 'AbelaTechB@gmail.com',
      ),
      RefillRequestData(
        branchId: '01',
        name: 'johannes Dereje',
        request: 'abel',
        date: '20/13/23',
        requestedBy: 'AbelaTechB@gmail.com',
      ),
      RefillRequestData(
        branchId: '01',
        name: 'johannes Dereje',
        request: 'abel',
        date: '20/13/23',
        requestedBy: 'AbelaTechB@gmail.com',
      ),
      RefillRequestData(
        branchId: '01',
        name: 'johannes Dereje',
        request: 'abel',
        date: '20/13/23',
        requestedBy: 'AbelaTechB@gmail.com',
      ),
      RefillRequestData(
        branchId: '01',
        name: 'johannes Dereje',
        request: 'abel',
        date: '20/13/23',
        requestedBy: 'AbelaTechB@gmail.com',
      ),
      // Add more DataB objects as needed
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Refill requests',
          style: TextStyle(
            fontSize: ResponsiveD.isDesktop(context) ? 23 : 20,
          ),
        ),
        Text(
          'List of refill requests',
          style: TextStyle(
            fontSize: ResponsiveD.isDesktop(context) ? 23 : 20,
          ),
        ),
        SizedBox(height: ResponsiveD.isDesktop(context) ? 40 : 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              _buildHeaderRow(ResponsiveD.isDesktop(context)),
              Column(
                children: data
                    .map(
                      (item) => _buildDataRow(
                        item,
                        ResponsiveD.isDesktop(context),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderRow(bool isTablet) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildHeaderCell('Branch_Id', isTablet),
            _buildHeaderCell('Name', isTablet),
            _buildHeaderCell('Request', isTablet),
            _buildHeaderCell('Date', isTablet),
            _buildHeaderCell('Requested By', isTablet),
            _buildHeaderCell('Actions', isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(RefillRequestData data, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildDataCell(data.branchId, isTablet),
            _buildDataCell(data.name, isTablet),
            _buildDataCell(data.request, isTablet),
            _buildDataCell(data.date, isTablet),
            _buildDataCell(data.requestedBy, isTablet),
            _buildDataCell('', isAction: true, isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, bool isTablet) {
    return SizedBox(
      width: isTablet ? 150 : 120,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDataCell(String text, bool isTablet, {bool isAction = false}) {
    return SizedBox(
      width: isTablet ? 150 : 120,
      child: isAction
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.message,
                  color: Colors.black,
                  size: isTablet ? 17 : 15,
                ),
                SizedBox(width: isTablet ? 17 : 10),
                Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: isTablet ? 17 : 15,
                ),
                SizedBox(width: isTablet ? 17 : 10),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: isTablet ? 17 : 15,
                ),
              ],
            )
          : Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: isTablet ? 16 : 14,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
