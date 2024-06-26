
class Invoice{
  String  invoiceNumber;
  String branchId;
  List<String> catagory;
  String incomeHead;
  DateTime createdAt;
  String? customerName;
  String invoiceId;
  double amount;
  double price;
  List<Map<String,dynamic>> items;
  Invoice({
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
   
factory Invoice.fromMap(Map<String,dynamic> data)=> 
  Invoice(
    invoiceNumber: data['invoiceNumber'] as String,
     invoiceId: data['invoiceId'] as String,
      amount: data['amount'] as double,
       price: data['price'] as double,
   catagory:data['catagory'] as List<String>,
 items: data['items'] as List<Map<String,dynamic>>,
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