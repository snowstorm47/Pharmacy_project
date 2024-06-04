class Batch{
 String location;
 String batchId;
 DateTime expiryDate;
 int stock;
 String batchNumber;
 DateTime dateAdded;
  Batch({
  required this.batchId,
  required   this.location,
  required this.expiryDate,
  required this.batchNumber,
  required this.stock,
  required this.dateAdded
  });
  factory Batch.fromMap(Map<String, dynamic> map) {
    return Batch(
      batchId:map['batchId'] as String,
      location: map['location'] as String,
      expiryDate: map['expiryDate'] as DateTime,
      stock: map['stock'] as int,
      batchNumber: map['batchNumber'] as String,
      dateAdded: map['dateAdded'] as DateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'batchId':batchId,
      'location': location,
      'expiryDate': expiryDate,
      'batchNumber': batchNumber,
      'dateAdded': dateAdded, 
    };
  }
}


   
  