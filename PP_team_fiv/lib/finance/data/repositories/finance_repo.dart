
import 'package:app/branch_M/data/repository/branch_repo.dart';
import 'package:app/finance/domain/entities/expense.dart';
import 'package:app/finance/domain/entities/invoice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/income.dart';

class FinanceRepo{
  final FirebaseFirestore _firebaseFirestore;
  FinanceRepo(this._firebaseFirestore);

 Future<void> addInvoice({
   branchId,
   amount,
  catagory,
  customerName,
  incomeHead,
  items,
  price
 })async{
  final incomeRef= _firebaseFirestore.collection('income');
  final createdAt= DateTime.now();
  final randomizer=  createdAt.toString();
  final invoiceId = ('INV' + '$randomizer');
  final income = Invoice(branchId: branchId, invoiceId: invoiceId, amount: amount, catagory: catagory, createdAt: createdAt, customerName: customerName, incomeHead: incomeHead, invoiceNumber: invoiceId, items: items, price: price);
  await incomeRef.doc(invoiceId).set(income.toMap());
 }
 
 Future<void> addExpense({
   branchId,
   amount,
  catagory,
  customerName,
  expenseHead,
  items,
  price
 })async{
  final expenseRef= _firebaseFirestore.collection('expense');
  final createdAt= DateTime.now();
  final randomizer=  createdAt.toString();
  final invoiceId = ('INV' + '$randomizer');
  final expense =Expense(branchId: branchId, invoiceId: invoiceId, amount: amount, catagory: catagory, createdAt: createdAt, customerName: customerName, expenseHead: expenseHead, invoiceNumber: invoiceId, items: items, price: price);
  await expenseRef.doc(invoiceId).set(expense.toMap());
 }
 Future<List<Object>?> getlistIncome()async{
  final incomeRef= _firebaseFirestore.collection('income');
  final snapshot= await incomeRef.get();
  return snapshot.docs.map((doc) => doc.data() as Map<String,dynamic>).toList();
 
 }
 Future<List<Object>?> getlistExpense()async{
  final expenseRef= _firebaseFirestore.collection('expense');
  final snapshot= await expenseRef.get();
  return  snapshot.docs.map((doc) => doc.data() as Map<String,dynamic>).toList();
 }

Future<double> getMonthIncome() async {
  final incomeRef = _firebaseFirestore.collection('income');
  final now = DateTime.now();
  final startOfMonth = DateTime(now.year, now.month, 1);
  final endOfMonth = DateTime(now.year, now.month + 1, 0);

  final querySnapshot = await incomeRef
      .where('dateAdded', isGreaterThanOrEqualTo: startOfMonth)
      .where('dateAdded', isLessThanOrEqualTo: endOfMonth)
      .get();

  double totalIncome = 0;
  for (var doc in querySnapshot.docs) {
    totalIncome += doc.get('amount');
  }

  return totalIncome;
}
 Future <double> getTodayincome()async{
  final today = DateTime.now().day;
  final incomeRef= _firebaseFirestore.collection('income');
  final snapshot =await incomeRef.where('createdAt',isEqualTo: today).get();
  double totalIncome = 0;
 for (var doc in snapshot.docs) {
  if (doc['amount'] != null) {
    totalIncome += doc['amount'];
  }
}

  return totalIncome;
 }
 Future <double> getTodayexpense()async{
  final today = DateTime.now().day;
  final expenseRef= _firebaseFirestore.collection('expense');
  final snapshot =await expenseRef.where('createdAt',isEqualTo: today).get();
  double totalExpense = 0;
 for (var doc in snapshot.docs) {
  if (doc['amount'] != null) {
    totalExpense += doc['amount'];
  }
}

  return totalExpense;
 }
 Future<Map<String,dynamic>> getIncome(String invoiceId)async{
 final incomeRef= _firebaseFirestore.collection('income').doc(invoiceId);
 final snapShot=await incomeRef.get();
   return snapShot.data() as Map<String,dynamic>;
   }
Future<Map<String,dynamic>> getExpense(String invoiceId)async{
 final expenseRef= _firebaseFirestore.collection('expense').doc(invoiceId);
final snapShot= await expenseRef.get();
return snapShot.data() as Map<String,dynamic>;
 }
 Future<double> getMonthExpense() async {
  final expenseRef = _firebaseFirestore.collection('expense');
  final now = DateTime.now();
  final startOfMonth = DateTime(now.year, now.month, 1);
  final endOfMonth = DateTime(now.year, now.month + 1, 0);

  final querySnapshot = await expenseRef
      .where('dateAdded', isGreaterThanOrEqualTo: startOfMonth)
      .where('dateAdded', isLessThanOrEqualTo: endOfMonth)
      .get();

  double totalExpense = 0;
  for (var doc in querySnapshot.docs) {
    if(doc['amount'] !=null){
    totalExpense += doc.get('amount');
    }
  }

  return totalExpense;
}
Future<void> buildInvoice(String invoiceId,String branchId)async{
 
 final branch = RegisterBranch(_firebaseFirestore).getBranch(branchId);
 final snapShot = await _firebaseFirestore.collection('income').doc(invoiceId).get();
  final invoice =Income.fromMap(snapShot.data() as Map<String,dynamic>);
}
Future<void> buildExpense()async{

}


}

