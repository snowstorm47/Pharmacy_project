// ignore_for_file: public_member_api_docs, sort_constructors_first
class Medicine {
  final String medicineName;
  final String catagory;
  final String weight;
  final String genericName;
  final double suppliersPrice;
  final double sellingPrice;
  final bool taxable;
  final bool prescriptionBased;
  final String details;
  final String branchName;
 Medicine({
  required this.medicineName,
 required this.branchName,
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
      branchName: map['branchId'] as String,
      catagory: map['Catagory'] as String,
      weight: map['weight'] as String,
      genericName: map['GenericName'] as String,
      suppliersPrice: map['SuppliersPrice'] as double,
      sellingPrice: map['SellingPrice'] as double,
      taxable: map['Taxable'] as bool,
      prescriptionBased: map['PrescriptionBased'] as bool,
      details: map['Details'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'medicineName': medicineName,
       // Assuming Batch has a toMap function
      'catagory': catagory,
      'weight': weight,
      'genericName': genericName,
      'suppliersPrice': suppliersPrice,
      'sellingPrice': sellingPrice,
      'taxable': taxable,
      'prescriptionBased': prescriptionBased,
      'details': details,
      'branchName':branchName
    };
  }
}