
class Income{
  String  invoiceNumber;
  String branchId;
  String catagory;
  String incomeHead;
  DateTime createdAt;
  String customerName;
  String invoiceId;
  double amount;
  double price;
  List<String> items;
  Income({
    required this.branchId,
    required this.invoiceId,
    required this.amount,
    required this.catagory,
    required this.createdAt,
    required this.customerName,
    required this.incomeHead,
    required this.invoiceNumber,
    required this.items,
    required this.price,
  
  });
   
factory Income.fromMap(Map<String,dynamic> data)=> 
  Income(
    invoiceNumber: data['invoiceNumber'] as String,
     invoiceId: data['invoiceId'] as String,
      amount: data['amount'] as double,
       price: data['price'] as double,
   catagory:data['catagory'] as String,
 items: data['items'] as List<String>,
  incomeHead:data['incomeHead'] as String,
 createdAt:data['createdAt'] as DateTime,
 branchId: data['branchId'] as String, 
 customerName: data['customerName'] as String,

  );
  Map<String,dynamic> toMap()=>{
  'invoiceId':invoiceId,
  'invoiceNumber':invoiceNumber,
   'amount':amount,
  'branchId':branchId,
  'catagory':catagory,
  'incomeHead':incomeHead,
  'createdAt':createdAt,
  'customerName':customerName,
  'price':price,
  'items':items,

  };

 



}