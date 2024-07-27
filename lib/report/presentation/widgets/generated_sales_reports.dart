import 'package:clean_a/finance/domain/entities/income.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clean_a/finance/presentation/widgets/income.dart'; // Adjust the import as necessary

class GeneratedSReports extends StatefulWidget {
  final DateTime fromDate;
  final DateTime toDate;

  const GeneratedSReports({
    Key? key,
    required this.fromDate,
    required this.toDate,
  }) : super(key: key);

  @override
  _GeneratedSReportsState createState() => _GeneratedSReportsState();
}

class _GeneratedSReportsState extends State<GeneratedSReports> {
  late Future<List<Income>> _salesData;

  @override
  void initState() {
    super.initState();
    _salesData = _fetchSalesData(widget.fromDate, widget.toDate);
  }

  Future<List<Income>> _fetchSalesData(DateTime fromDate, DateTime toDate) async {
    // Replace with your data fetching logic
    // For example, make a call to a repository or API
    // Here, we use mock data for illustration

    // Example mock data
    List<Income> salesData = [
      Income(
        invoiceNumber: '123',
        branchId: 'branch1',
        catagory: 'Category1',
        incomeHead: 'IncomeHead1',
        createdAt: DateTime.now(),
        customerName: 'Customer1',
        invoiceId: 'invoice1',
        amount: 100.0,
        price: 120.0,
        items: ['Item1', 'Item2'],
      ),
      // Add more mock data if needed
    ];

    // Filter data based on date range
    return salesData.where((data) {
      return data.createdAt.isAfter(fromDate) && data.createdAt.isBefore(toDate);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Sales Report'),
      ),
      body: FutureBuilder<List<Income>>(
        future: _salesData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available for the selected date range.'));
          } else {
            final List<Income> salesData = snapshot.data!;
            return DataTable(
              columns: const [
                DataColumn(label: Text('Invoice Number')),
                DataColumn(label: Text('Customer Name')),
                DataColumn(label: Text('Amount')),
                DataColumn(label: Text('Date')),
                // Add other columns as needed
              ],
              rows: salesData.map((income) {
                return DataRow(
                  cells: [
                    DataCell(Text(income.invoiceNumber ?? 'N/A')), // Use null-aware operator
                    DataCell(Text(income.customerName ?? 'N/A')), // Use null-aware operator
                    DataCell(Text(income.amount?.toString() ?? '0')), // Use null-aware operator
                    DataCell(Text(DateFormat('yyyy-MM-dd').format(income.createdAt ?? DateTime.now()))), // Use null-aware operator
                    // Add other cells as needed
                  ],
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
