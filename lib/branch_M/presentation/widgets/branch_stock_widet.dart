
import 'package:clean_a/medicine/domain/entities/batch.dart';
import 'package:clean_a/medicine/domain/entities/medicine.dart';
import 'package:clean_a/medicine/providers/medicine_provider.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';



class BranchStockWidget extends StatelessWidget {
  final List<Batch> data;
  final List<Medicine> med;
  final List<MedColor> medColor;
  final String? branch;

  



  const BranchStockWidget({super.key, required this.data,required this.med,required this.medColor,required this.branch});

  @override
  Widget build(BuildContext context) {
     
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isTablet = constraints.maxWidth > 600;
        double padding = isTablet ? 46.0 : 16.0;
        if(branch == '' ){
          return const Center(child:Text("Please go to the Stock Menu"));
        }
         
        return Padding(
          padding: EdgeInsets.all(padding),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Branch Stock',
                  style: TextStyle(fontSize: isTablet ? 23 : 20),
                ),
             
                Text(
                  branch!,
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
                    ],
                  ),
                ),
                SizedBox(height: isTablet ? 40 : 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      _buildStatusKey(),
                      const SizedBox(height: 10),
                      _buildHeaderRow(isTablet),
                      const SizedBox(height: 10),
                      Column(
                        children: getBatch(data,branch!)
                            .map((item) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: _buildDataRow(item,med,medColor, isTablet),
                                ))
                            .toList(),
                      ),
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

  Widget _buildHeaderRow(bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildHeaderCell('Batch', isTablet),
            _buildHeaderCell('Product Name', isTablet),
            _buildHeaderCell('Category', isTablet),
            _buildHeaderCell('Price', isTablet),
            _buildHeaderCell('Expiry Date', isTablet),
            _buildHeaderCell('Quantity', isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(Batch? data,List<Medicine> med,List<MedColor> medColor, bool isTablet) {
    if(data == null){
      return Container(); 
    }
    final date = data.expiryDate;
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    return Container(
      decoration: BoxDecoration(
        color:getColor(data,medColor),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildDataCell(data.batchNumber, isTablet),
            _buildDataCell(data.medName, isTablet),
            _buildDataCell(getCatagory(data,med).toString(), isTablet),
            _buildDataCell(data.sellingPrice.toString(), isTablet),
            _buildDataCell(formattedDate.toString(), isTablet),
            _buildDataCell(data.stock.toString(), isTablet),
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
      ),
    );
  }

  Widget _buildDataCell(String text, bool isTablet) {
    return SizedBox(
      width: isTablet ? 150 : 120,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildStatusKey() {
    return Row(
      children: [
        _buildKey(const Color.fromARGB(255, 234, 109, 100), 'Expired'),
        const SizedBox(width: 10),
        _buildKey(const Color.fromARGB(255, 203, 239, 59), 'Pending'),
        const SizedBox(width: 10),
        _buildKey(const Color.fromARGB(255, 97, 190, 101), 'Safe'),
      ],
    );
  }

  Widget _buildKey(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        const SizedBox(width: 5),
        Text(text),
      ],
    );
  }
  
    String? getCatagory(Batch? data,List<Medicine>? medicines) {
      if (medicines == null && data == null  ) {
        return null;
      }
     
      for (final med in medicines!) {
        if(data!.medName == med.medicineName){
        return med.catagory;
        }
      }
     
    }
     Color? getColor(Batch data, List<MedColor> medColors) {
      for (final item in medColors) {
        if (item.medicineName == data.medName) {
          return item.color;
        }
      }
     return null;
    }
    List<Batch> getBatch(List<Batch> data, String branch) {
       List<Batch> batches =[];
      for (final item in data) {
        if (item.branchName == branch) {
          batches.add(item);
        }
      }
     return batches;
    }
}
