
import 'package:clean_a/finance/domain/entities/expense.dart';
import 'package:clean_a/finance/domain/entities/income.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportRepo{
FirebaseFirestore _firebaseFirestore= FirebaseFirestore.instance;



Future<List<Income>?> generateSalesReport(DateTime startingDate,DateTime endTime) async{
 
 final invoiceRef = _firebaseFirestore.collection('income');
 final query = invoiceRef.where('createdAt',isGreaterThanOrEqualTo: startingDate,isLessThanOrEqualTo:endTime);
 final snapshot= await query.get();
return snapshot.docs.map((doc) {
    return Income.fromMap(doc.data() as Map<String, dynamic>);
  }).toList();
}
Future<List<Expense>?> generatePurchaseReport(DateTime startingDate,DateTime endTime) async{
final invoiceRef = _firebaseFirestore.collection('expense');
 final query = invoiceRef.where('createdAt',isGreaterThanOrEqualTo: startingDate,isLessThanOrEqualTo:endTime);
 final snapshot= await query.get();
return snapshot.docs.map((doc) {
    return Expense.fromMap(doc.data() as Map<String, dynamic>);
  }).toList();
}
}