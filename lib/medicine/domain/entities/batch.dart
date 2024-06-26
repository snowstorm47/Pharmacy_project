class Batch{
 String location;
 double sellingPrice;
 double suppliersPrice;
 String branchId;
 DateTime expiryDate;
 int stock;
 String batchNumber;
 DateTime dateAdded;
 bool taxable;
 
  Batch({
  required this.suppliersPrice,
  required this.sellingPrice,
  required   this.location,
  required this.expiryDate,
  required this.batchNumber,
  required this.stock,
  required this.dateAdded,
  required this.branchId,
  required this.taxable
  });
    factory Batch.fromMap(Map<String,dynamic> data)=> 
  Batch(
  sellingPrice:data['sellingPrice'] as double,
  suppliersPrice: data['supplierPrice'] as double,
  taxable: data['taxable'] as  bool,
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
  'sellingPrice':sellingPrice,
  'suppliersPrice':suppliersPrice,
  'taxable':taxable,
 'branchId':branchId
  };
   
  }


   
  