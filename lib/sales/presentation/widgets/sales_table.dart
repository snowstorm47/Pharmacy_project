import 'package:clean_a/medicine/domain/entities/batch.dart';
import 'package:clean_a/medicine/domain/entities/medicine.dart';
import 'package:clean_a/medicine/providers/medicine_provider.dart';
import 'package:clean_a/sales/provider/sales_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalesTable extends StatefulWidget {
  SalesTable({super.key});

  @override
  State<SalesTable> createState() => _SalesTableState();
}

class _SalesTableState extends State<SalesTable> {
  @override
  void initState() {
    super.initState();
    // Fetch data from provider
    Future.microtask(() async {
      final provider = Provider.of<MedicineProvider>(context, listen: false);
      await provider.getMedicines();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    final provider = Provider.of<MedicineProvider>(context, listen: true);
    final List<Batch> data = provider.batches ?? [];
    final List<Medicine> med = provider.medicines ?? [];

    if (med.isEmpty || data.isEmpty) {
      return Center(child: Text('Nothing to Sell'));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(isMobile ? 120 : 150),
          1: FixedColumnWidth(isMobile ? 120 : 150),
          2: FixedColumnWidth(isMobile ? 120 : 150),
          3: FixedColumnWidth(isMobile ? 120 : 150),
          4: FixedColumnWidth(isMobile ? 120 : 150),
          5: FixedColumnWidth(isMobile ? 120 : 150),
        },
        children: [
          _buildHeaderRow(isMobile),
          ...data.map((item) => _buildDataRow(context, item, med, isMobile)).toList(),
        ],
      ),
    );
  }

  TableRow _buildHeaderRow(bool isMobile) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      children: [
        _buildHeaderCell('Medicine Name', isMobile),
        _buildHeaderCell('Category', isMobile),
        _buildHeaderCell('Weight', isMobile),
        _buildHeaderCell('In Stock', isMobile),
        _buildHeaderCell('Price per Unit', isMobile),
        _buildHeaderCell('Actions', isMobile),
      ],
    );
  }

  TableRow _buildDataRow(BuildContext context, Batch data, List<Medicine> med, bool isMobile) {
    final cartProvider = context.watch<SalesProvider>();
    final TextEditingController qtyController = TextEditingController();

    return TableRow(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      children: [
        _buildDataCell(data.medName, isMobile),
        _buildDataCell(getCategory(med, data).toString(), isMobile),
        _buildDataCell(getWeight(med, data).toString(), isMobile),
        _buildDataCell(data.stock.toString(), isMobile),
        _buildDataCell(data.sellingPrice.toString(), isMobile),
        _buildActionCell(context, data, qtyController),
      ],
    );
  }

  Widget _buildHeaderCell(String text, bool isMobile) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 8.0 : 12.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, bool isMobile) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 8.0 : 12.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: isMobile ? 14 : 16,
        ),
      ),
    );
  }

  Widget _buildActionCell(BuildContext context, Batch data, TextEditingController qtyController) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: context.watch<SalesProvider>().isItemInCart(data),
                onChanged: (bool? value) {
                  if (value == true) {
                    context.read<SalesProvider>().addToCart(
                          data.medName,
                          data.sellingPrice,
                          int.tryParse(qtyController.text) ?? 0,
                        );
                  } else {
                    context.read<SalesProvider>().removeItem(data);
                  }
                },
              ),
              const SizedBox(width: 8.0),
              Container(
                width: 50,
                height: 24,
                child: TextFormField(
                  controller: qtyController,
                 
                  onChanged: (value) {
                  
                  
                    if (int.tryParse(value) != null) {
                      setState(() {
                        data.stock -= int.tryParse(value)!;
                      });
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    hintText: 'Qty',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String? getCategory(List<Medicine>? data, Batch? batch) {
    if (data != null && batch != null) {
      for (final item in data) {
        if (batch.medName == item.medicineName) {
          return item.catagory;
        }
      }
    }
    return null;
  }

  String? getWeight(List<Medicine>? data, Batch? batch) {
    if (data != null && batch != null) {
      for (final item in data) {
        if (batch.medName == item.medicineName) {
          return item.weight;
        }
      }
    }
    return null;
  }
}
