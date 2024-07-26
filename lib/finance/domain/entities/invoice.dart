
import 'package:cloud_firestore/cloud_firestore.dart';

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
   factory Invoice.fromMap(Map<String, dynamic> data) {
  return Invoice(
    invoiceNumber: data['invoiceNumber'] as String,
    invoiceId: data['invoiceId'] as String,
    amount: (data['amount'] as num).toDouble(), // Convert to double if needed
    price: (data['price'] as num).toDouble(), // Convert to double if needed
    catagory: List<String>.from(data['catagory'] ?? []), // Safely convert to List<String>
    items: List<Map<String, dynamic>>.from(data['items'] ?? []), // Safely convert to List<Map<String, dynamic>>
    incomeHead: data['incomeHead'] as String,
    createdAt: (data['createdAt'] as Timestamp).toDate(), // Convert Firestore Timestamp to DateTime
    branchId: data['branchId'] as String,
    customerName: data['customerName'] as String?, // Nullable String
  );
}

Map<String, dynamic> toMap() {
  return {
    'invoiceId': invoiceId,
    'invoiceNumber': invoiceNumber,
    'amount': amount,
    'branchId': branchId,
    'catagory': catagory,
    'incomeHead': incomeHead,
    'createdAt': Timestamp.fromDate(createdAt), // Convert DateTime to Firestore Timestamp
    'customerName': customerName,
    'price': price,
    'items': items,
  };
}

}