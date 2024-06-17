
class Expense{
  String  invoiceNumber;
  String branchId;
  String catagory;
  String expenseHead;
  DateTime createdAt;
  String customerName;
  String invoiceId;
  double amount;
  double price;
  List<String>? items;
  Expense({
    required this.branchId,
    required this.invoiceId,
    required this.amount,
    required this.catagory,
    required this.createdAt,
    required this.customerName,
    required this.expenseHead,
    required this.invoiceNumber,
    required this.items,
    required this.price,
  
  });
   
factory Expense.fromMap(Map<String,dynamic> data)=> 
  Expense(
    invoiceNumber: data['invoiceNumber'] as String,
     invoiceId: data['invoiceId'] as String,
      amount: data['amount'] as double,
       price: data['price'] as double,
   catagory:data['catagory'] as String,
 items: data['items'] as List<String>?,
  expenseHead:data['expenseHead'] as String,
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
  'expenseHead':expenseHead,
  'createdAt':createdAt,
  'customerName':customerName,
  'price':price,
  'items':items,
  };
}