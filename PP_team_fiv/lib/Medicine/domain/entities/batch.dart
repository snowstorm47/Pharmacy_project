class Batch{
 String Location;
 DateTime ExpiryDate;
 int Stock;
 String BatchNumber;
 DateTime dateAdded;
  Batch({
  required   this.Location,
  required this.ExpiryDate,
  required this.BatchNumber,
  required this.Stock,
  required this.dateAdded
  });
  factory Batch.fromMap(Map<String, dynamic> map) {
    return Batch(
      Location: map['Location'] as String,
      ExpiryDate: DateTime.parse(map['ExpiryDate'] as String),
      Stock: map['Stock'] as int,
      BatchNumber: map['BatchNumber'] as String,
      dateAdded: DateTime.parse(map['dateAdded'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Location': Location,
      'ExpiryDate': ExpiryDate.toString(), // Convert DateTime to String
      'Stock': Stock,
      'BatchNumber': BatchNumber,
      'dateAdded': dateAdded.toString(), // Convert DateTime to String
    };
  }
}


   
  