class Medicine {
  String MedicineName;
  String MedicineId;
  String Catagory;
  int weight;
  String GenericName;
  int  SuppliersPrice;
  int SellingPrice;
  DateTime ExpiryDate;
  int Stock;
  bool Taxable;
  bool PrescriptionBased;
  String Details;
  String Location;
  Medicine({
    required this.Location,
    required this.MedicineName,
    required this.MedicineId,
    required this.Catagory,
    required this.weight,
    required this.GenericName,
    required this.SuppliersPrice,
    required this.SellingPrice,
    required this.ExpiryDate,
    required this.Stock,
    required this.Taxable,
    required this.PrescriptionBased,
    required this.Details,
  });  
  
factory Medicine.fromMap(Map<String,dynamic> data)=> 
  Medicine(
    Location:data['Location'] as String,
   MedicineName:data['MedicineName'] as String,
   MedicineId:data['MedicineId'] as String,
  Catagory:data['Catagory'] as String,
   weight:data['weight'] as int,
  GenericName:data['GenericName'] as String,
    SuppliersPrice:data['SuppliersPrice'] as int,
  SellingPrice:data['SellingPrice'] as int,
   ExpiryDate:data['ExpiryDate'] as DateTime,
   Stock:data['Stock'] as int,
  Taxable:data['Taxable'] as bool,
 PrescriptionBased:data['PrescriptionBased'] as bool,
  Details:data['Details'] as String,

  );
  
   Map<String,dynamic> toMap()=>{
   'Location':Location,
   ' MedicineName': MedicineName,
   ' MedicineId': MedicineId,
   'Catagory':Catagory,
   'weight':weight,
   'GenericName':GenericName,
   'SuppliersPrice':SuppliersPrice,
   'SellingPrice':SellingPrice,
   'ExpiryDate':ExpiryDate,
    'Stock':Stock,
    'Taxable':Taxable,
    'PrescriptionBased':PrescriptionBased,
    'Details':Details,
  };

  }