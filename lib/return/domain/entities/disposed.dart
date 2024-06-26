class Disposed{
  String batchId;
  String medicineName;
  String catagory;
  String sellingPrice;
  String genericName;
  String reason;
  DateTime dateAdded;
Disposed({
  required this.batchId,
  required this.medicineName,
  required this.catagory,
  required this.genericName,
  required this.sellingPrice,
  required this.reason,
  required this.dateAdded
});

factory Disposed.fromMap(Map<String,dynamic> data) =>
  Disposed(
  batchId: data["batchId"] as String,
  medicineName: data['medicineName'] as String, 
  catagory: data['catagory'] as String, 
  genericName:data['genericName'] as String, 
  sellingPrice: data['sellingPrice'] as String, 
  reason: data['reason'] as String,
  dateAdded: data['dateAdded'] as DateTime
  );
Map<String,dynamic> toMap()=>{

  'batchId':batchId,
  'medicineName':medicineName,
  'catagory':catagory,
  'sellingPrice':sellingPrice,
  'genericName':genericName,
  'reason':reason,
  'dateAdded':dateAdded
};
}