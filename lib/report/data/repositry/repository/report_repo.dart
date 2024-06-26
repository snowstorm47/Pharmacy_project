
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportRepo{
FirebaseFirestore _firebaseFirestore;
ReportRepo(this._firebaseFirestore);

Future<void> generateSalesReport(DateTime startingDate,DateTime endTime) async{
 
 final invoiceRef = _firebaseFirestore.collection('income');
 final query = invoiceRef.where('createdAt',isGreaterThanOrEqualTo: startingDate,isLessThanOrEqualTo:endTime);
 final snapshot= await query.get();


}
Future<void> generatePurchaseReport(DateTime startingDate,DateTime endTime) async{
final invoiceRef = _firebaseFirestore.collection('expense');
 final query = invoiceRef.where('createdAt',isGreaterThanOrEqualTo: startingDate,isLessThanOrEqualTo:endTime);
 final snapshot= await query.get();
}
}