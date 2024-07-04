
import 'dart:convert';
import 'dart:html' as html;
import 'package:app/Medicine/data/repository/medicine_repo.dart';
import 'package:app/finance/domain/entities/cart.dart';
import 'package:app/finance/domain/entities/invoice.dart';
import 'package:app/sales/data/helper/expenseInvoiceCreator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../helper/incomeInvoiceCreator.dart';


class SalesRepo{
  final FirebaseFirestore _firebaseFirestore;
  SalesRepo(this._firebaseFirestore);

  Future<void> sellProduct(Cart cart,String branchId)async{
    final items = cart.items;
    final  invoiceId = DateTime.now().toString();
    List<Map<String,dynamic>> soldItems=[];
    List<String> catagory=[];
    double subTotal=0.0;
    for(final item in items){
      int quantity = item.quantity;
      String medicineName = item.medicineName;
      final price=await MedicineRepo(_firebaseFirestore).sellItem(medicineName,quantity);
       if(price!=null){
        subTotal += price;
        soldItems.add({'name':medicineName,
                       'price':price,
                       'quantity':quantity,
                       'total':price*quantity,
                      });
        catagory.add(medicineName);
       }
       else{
        throw Exception('error occured');
       }
    }
    final invoice = Invoice(branchId: branchId, invoiceId: invoiceId, amount: subTotal, catagory: catagory, createdAt: DateTime.now(), customerName:null, incomeHead: 'Pharmacy', invoiceNumber: invoiceId, items: soldItems, price: subTotal);
    await _firebaseFirestore.collection('income').doc(invoiceId).set(invoice.toMap());
  }
  Future<void> sellCredit( Cart cart,String customerName,String companyName,String branchId)async{
  final items = cart.items;
  final invoiceId = DateTime.now().toString();
  double subTotal=0.0;
  List<String>catagory=[];
  List<Map<String,dynamic>> soldItems=[];
  for(final item in items){
    int quantity = item.quantity;
    String medicineName = item.medicineName;
      final price=await MedicineRepo(_firebaseFirestore).sellCredit(medicineName,companyName,customerName,quantity);
       if(price!=null){
        subTotal += price;
        soldItems.add({
          'name':medicineName,
           'price':price,
          'quantity':quantity,
           'total':price*quantity,
         });
        catagory.add(medicineName);
       }
       else{
        throw Exception("error Occured");
       }
  }
  
  final invoice = Invoice(branchId: branchId, invoiceId: invoiceId, amount: subTotal, catagory:catagory , createdAt: DateTime.now(), customerName: customerName, incomeHead: 'Pharmacy', invoiceNumber: invoiceId, items: soldItems, price: subTotal);
    await _firebaseFirestore.collection('income').doc(invoiceId).set(invoice.toMap());
  }
  
  Future<Map<String,dynamic>?> creatPdfInvoice(String id)async{
   final invoiceRef =  _firebaseFirestore.collection('income').doc(id);
   final invoice =await invoiceRef.get();
   if(invoice!= null){
    final invoiceData= invoice.data() as  Map<String,dynamic>;
    final doc =  await Invoicecreator().generatePdf(invoiceData);
    final fileName="income"+invoiceData['invoiceId'];
    Map<String,dynamic> Fileinfo={};
    Fileinfo['file']=doc;
    Fileinfo['name']=fileName;
    return Fileinfo;
   }
   return null;
   }

  Future<void> downloadPdf(Map<String,dynamic> fileInfo)async{
    if(fileInfo["name"]!=null && fileInfo['file']!=null){
   final name = fileInfo["name"]+".pdf";
   final doc = fileInfo['file'];
   final base64String = base64Encode(doc);
  final dataUrl = 'data:application/pdf;base64,$base64String';

  final anchor = html.document.createElement('a') as html.AnchorElement;
  anchor.href = dataUrl;
  anchor.download = name;

  // Simulate click event without manipulating DOM directly
  final event = html.MouseEvent('click');
  anchor.dispatchEvent(event);
    }
  
  }




  Future<Map<String,dynamic>?> createPdfExpense(String id)async{
   final expenseRef = _firebaseFirestore.collection('expense').doc(id);
   final expense= await expenseRef.get();
   if(expense!= null){
    final expenseData = expense.data() as Map<String,dynamic>;
    final doc = await ExpenseInvoiceCreator().generatePdf(expenseData);
        final fileName="expense"+expenseData['invoiceId'];
    Map<String,dynamic> Fileinfo={};
    Fileinfo['file']=doc;
    Fileinfo['name']=fileName;
    return Fileinfo;
   }
   return null;
  }
}