class DataMD {
  final String medicineName;
  final String id;
  final String genericName;
  final String category;
  final String weight;
  final String expiryDate;
  final bool isTaxable;
  final bool isPrescribed;

  DataMD({
    required this.medicineName,
    required this.id,
    required this.genericName,
    required this.expiryDate,
    required this.weight,
    required this.category,
    required this.isTaxable,
    required this.isPrescribed,
  });
}
