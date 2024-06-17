class Batch{
 String location;

 String branchId;
 DateTime expiryDate;
 int stock;
 String batchNumber;
 DateTime dateAdded;
 
  Batch({
  
  required   this.location,
  required this.expiryDate,
  required this.batchNumber,
  required this.stock,
  required this.dateAdded,
  required this.branchId
  });
    factory Batch.fromMap(Map<String,dynamic> data)=> 
  Batch(
  
   location:data['Location'] as String,
  expiryDate:data['ExpiryDate'] as DateTime,
  stock:data['Stock'] as int,
  batchNumber:data['BatchNumber'] as String,
 dateAdded:data['dateAdded'] as DateTime,
 branchId: data['branchId'] as String,
  );
  Map<String,dynamic> toMap()=>{
  'location':location,
  'expiryDate':expiryDate,
 'stock':stock,
  'batchNumber':batchNumber,
 'dateAdded':dateAdded,

 'branchId':branchId
  };
   
  }


   
  