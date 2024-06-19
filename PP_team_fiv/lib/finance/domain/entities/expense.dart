class Expense{
 
  String branchId;
  String catagory;
  String expenseHead;
  DateTime createdAt;
  
  String invoiceId;
  double amount;

  
  Expense({
    required this.branchId,
    required this.invoiceId,
    required this.amount,
    required this.catagory,
    required this.createdAt,
  
    required this.expenseHead,
   
  
  });
   
factory Expense.fromMap(Map<String,dynamic> data)=> 
  Expense(
 
     invoiceId: data['invoiceId'] as String,
      amount: data['amount'] as double,
      
   catagory:data['catagory'] as String,

  expenseHead:data['expenseHead'] as String,
 createdAt:data['createdAt'] as DateTime,
 branchId: data['branchId'] as String, 
 

  );
  Map<String,dynamic> toMap()=>{
  'invoiceId':invoiceId,
 
   'amount':amount,
  'branchId':branchId,
  'catagory':catagory,
  'expenseHead':expenseHead,
  'createdAt':createdAt,
  
  

  };

 



}