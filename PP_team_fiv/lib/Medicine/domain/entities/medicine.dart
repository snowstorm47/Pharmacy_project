// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:app/Medicine/domain/entities/batch.dart';
class Medicine {
  final String medicineName;
  final List<Batch> batch; // Assuming Batch is a defined class
  final String catagory;
  final String weight;
  final String genericName;
  final int suppliersPrice;
  final int sellingPrice;
  final bool taxable;
  final bool prescriptionBased;
  final String details;
 Medicine({
  required this.medicineName,
  required this.batch,
  required this.catagory,
  required this.weight,
  required this.details,
  required this.genericName,
  required this.prescriptionBased,
  required this.sellingPrice,
  required this.suppliersPrice,
  required this.taxable
  
 });
  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      medicineName: map['medicineName'] as String,
      
      batch: (map['batch'] as List<dynamic>).cast<Batch>(), // Assuming Batch has a fromMap function
      catagory: map['Catagory'] as String,
      weight: map['weight'] as String,
      genericName: map['GenericName'] as String,
      suppliersPrice: map['SuppliersPrice'] as int,
      sellingPrice: map['SellingPrice'] as int,
      taxable: map['Taxable'] as bool,
      prescriptionBased: map['PrescriptionBased'] as bool,
      details: map['Details'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'medicineName': medicineName,
      'batch': batch, // Assuming Batch has a toMap function
      'catagory': catagory,
      'weight': weight,
      'genericName': genericName,
      'suppliersPrice': suppliersPrice,
      'sellingPrice': sellingPrice,
      'taxable': taxable,
      'prescriptionBased': prescriptionBased,
      'details': details,
    };
  }
}