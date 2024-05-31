// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:app/Medicine/domain/entities/batch.dart';

class Medicine {
  final String MedicineName;
  final int balance;
  final List<Batch> batch; // Assuming Batch is a defined class
  final String Catagory;
  final String weight;
  final String GenericName;
  final int SuppliersPrice;
  final int SellingPrice;
  final bool Taxable;
  final bool PrescriptionBased;
  final String Details;
 Medicine({
  required this.MedicineName,
  required this.balance,
  required this.batch,
  required this.Catagory,
  required this.weight,
  required this.Details,
  required this.GenericName,
  required this.PrescriptionBased,
  required this.SellingPrice,
  required this.SuppliersPrice,
  required this.Taxable
  
 });
  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      MedicineName: map['MedicineName'] as String,
      balance: map['balance'] as int,
      batch: (map['batch'] as List<dynamic>).cast<Batch>(), // Assuming Batch has a fromMap function
      Catagory: map['Catagory'] as String,
      weight: map['weight'] as String,
      GenericName: map['GenericName'] as String,
      SuppliersPrice: map['SuppliersPrice'] as int,
      SellingPrice: map['SellingPrice'] as int,
      Taxable: map['Taxable'] as bool,
      PrescriptionBased: map['PrescriptionBased'] as bool,
      Details: map['Details'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'MedicineName': MedicineName,
      'balance': balance,
      'batch': batch, // Assuming Batch has a toMap function
      'Catagory': Catagory,
      'weight': weight,
      'GenericName': GenericName,
      'SuppliersPrice': SuppliersPrice,
      'SellingPrice': SellingPrice,
      'Taxable': Taxable,
      'PrescriptionBased': PrescriptionBased,
      'Details': Details,
    };
  }
}
