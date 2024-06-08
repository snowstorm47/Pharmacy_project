import 'dart:ui';

import 'package:app/Medicine/domain/entities/batch.dart';
import 'package:app/Medicine/domain/entities/medicine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


class MedicineRepo{

  final FirebaseFirestore _firebaseFirestore;
  MedicineRepo(this._firebaseFirestore);
 
Future<void>  addMedicine(
  {
   
     required medicineName,
     required branchId,
    required location,
    required catagory,
    required weight,
    required genericName,
    required suppliersPrice,
    required sellingPrice,
    required expiryDate,
    required stock,
    required taxable,
    required prescriptionBased,
    required details,
    required DateTime dateAdded
  }
  )async{
  
  final CollectionReference medRef = _firebaseFirestore.collection('medicine');
  final docName= medicineName;
  final batchNumber= dateAdded.toString();
 final batchRef = medRef.doc(branchId).collection('batches');
 final batchId = batchRef.doc().id;
final batch= Batch(location: location, expiryDate: expiryDate, batchNumber: dateAdded.toString(), stock: stock, dateAdded: dateAdded,batchId:batchId,branchId:branchId);
await batchRef.doc(batchId).set(batch.toMap());
    
      await medRef.doc(docName).set({
    'catagory': catagory,
    'medicineName': medicineName,
    'weight': weight,
    'details': details,
    'genericName': genericName,
    'prescriptionBased': prescriptionBased,
    'sellingPrice': sellingPrice,
    'suppliersPrice': suppliersPrice,
    'taxable': taxable,
    'branchId':branchId
  
  });
  }
  Future<void> deleteMedicince({
    required medicineName,
    required branchId,
    required catagory,
    required reason,
    required stock,
    required details,
  }) async{
 CollectionReference medRef =  _firebaseFirestore.collection('medicine');
// Create a query to find the product document with matching name (doc ID) and store ID
final query = medRef
  .where('medicineName', isEqualTo: medicineName)
  .where('branchId', isEqualTo: branchId);  // Name matches doc ID

 final future = query.get().then((querySnapshot) {
  if (querySnapshot.docs.isNotEmpty) {
    // Get the document reference from the first document (assuming there should be only one)
    final docRef = querySnapshot.docs.first.reference;
    // Delete the document
    return docRef.delete();
  } else {
    // Handle the case where no document is found (optional)
    print('No product found with that name and store ID');
    return null;
  }
});

// Optionally, handle the future result (success or failure)
future.then((_) => print('Product deleted successfully')).catchError((error) => print('Error deleting product: $error'));
  }
Future<void> removeBatch({required medicineName,required batchid,required branchId}) async {

  final CollectionReference medRef = _firebaseFirestore.collection('medicine');

  try {
    // Create a reference to the specific batch document
    
    final query = medRef
  .where('medicineName', isEqualTo: medicineName)
  .where('branchId', isEqualTo: branchId);  // Name matches doc ID

 final future = query.get().then((querySnapshot) {
  if (querySnapshot.docs.isNotEmpty) {
    // Get the document reference from the first document (assuming there should be only one)
    final docRef = querySnapshot.docs.first.reference;
    // Delete the document
    final batchRef =docRef.collection('batches').doc(batchid);
    batchRef.delete();
  } else {
    // Handle the case where no document is found (optional)
    print('No product found with that name and store ID');
    return null;
  }
});
   
    print('Batch "$batchid" from medicine "$medicineName" deleted successfully.');
  } catch (error) {
    // Handle potential errors (e.g., document not found, network issues)
    print('Error deleting batch: $error');
  }


}

Future<void> updateMedicine( String medicineName, {required Map<String,dynamic> updatedData}) async{

final medRef =_firebaseFirestore.collection('medicine');
final document = medRef.doc(medicineName);
await _firebaseFirestore.runTransaction((transaction) async {
  final docSnapshot = await transaction.get(document);
  if(!docSnapshot.exists){
   throw Exception ("Medicine with the  name $medicineName doesn't exist");
  }
  final existingData = docSnapshot.data()!;
  existingData.updateAll((key,value)=> updatedData.containsKey(key)? updatedData[key] : value);
  transaction.set( document,existingData);
});
}

Future<List<Object>?> searchMedicine( String medicineName) async {
  final searchTerm = medicineName.toLowerCase(); // Lowercase search term
  final medRef = _firebaseFirestore.collection('medicine');
  final query = medRef.where('medicineName', isEqualTo: searchTerm); // Match exact name
 return query.get().then((querySnapshot) {
    print(querySnapshot.docs); // Print retrieved documents
     return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();;
  });
}


Future<bool> checkExpiry(String medicineName,String batchNumber)async{
 
  final CollectionReference medRef = _firebaseFirestore.collection('medicine');

  try {
    // Create a reference to the specific batch document
    final batchRef = medRef.doc(medicineName).collection('batches').doc(batchNumber);

    final docSnapshot = await batchRef.get();

    if (docSnapshot.exists) {
      final batchData = docSnapshot.data()!;
      final expiryDate = batchData['expiryDate'] as Timestamp;

      // Check if expiry date has passed
      return expiryDate.toDate().isBefore(DateTime.now());
    } else {
      // Handle case where batch document doesn't exist
      print('Batch "$batchNumber" not found in medicine "$medicineName".');
      return false; // Or handle differently based on your logic
    }
  } catch (error) {
    // Handle potential errors (e.g., document not found, network issues)
    print('Error checking batch expiry: $error');
    return false; // Or handle differently based on your logic
  }


}

Future<Color?> colorCoding(String batchNum,String medicineName) async{
   final searchItem = batchNum;
   final med = medicineName;

   final batchRef = _firebaseFirestore.collection('medicine').doc(med).collection('batches').doc(searchItem);
  DateTime now = DateTime.now();
  Duration oneDay = const Duration(days: 1);
  Duration oneMonth = const Duration(days: 30); 
  // Assuming 30 days per month

  // Calculate minimum and maximum expiry dates within the range
  DateTime minExpiryDate = now.add(oneDay);
  DateTime maxExpiryDate = now.add(oneMonth);

  
 final docSnapshot = await batchRef.get() ;
  if(docSnapshot.exists){
final data = docSnapshot.data();
if(data!=null){
          if (data['expiryDate'] != null) {
              final batchExpiryDate = data['expiryDate'] as Timestamp;
              final expiryDate = batchExpiryDate.toDate();

              if (expiryDate == now) {
                return Colors.red; // Expired
              } else if (expiryDate.isAtSameMomentAs(minExpiryDate) ||
                  expiryDate.isAfter(minExpiryDate) &&
                      expiryDate.isBefore(maxExpiryDate.add(oneDay))) {
                return Colors.yellow; // Nearly Expired
              } else {
                return Colors.green; // Not Expired
              }
     }}


  }else{
    print('there is no file');
  }
 
   return null;
 
}  
Future<void> sellItem(String medicineName, int quantityToSell,String branchId) async {
  final medicineRef = _firebaseFirestore.collection('medicine');
  final query= medicineRef.where('medicineName',isEqualTo:medicineName).where('branchId',isEqualTo:branchId);
   final querySnapshot = await query.get();
   final med= await querySnapshot.docs.first.reference;
   final batchRef= med.collection('batches');
   final docSnapshot = await  batchRef.get();

  await _firebaseFirestore.runTransaction((transaction) async {
     if(docSnapshot!= null){
        final documents = docSnapshot.docs;
        for(final doc in documents){
          final batch = doc.data()!;
          
           if(batch != null){
           final batchList = batch as Map<String,dynamic>;
           final quantity = batchList['stock'];
           if(quantity >= quantityToSell){
             final newquantity = quantity -quantityToSell;
             if(newquantity == 0){
              final batchId = batchList['batchId'];
              await transaction.delete(batchRef.doc(batchId));
             }
             else{
              final batchId = batchList['batchId'];
              await transaction.update(batchRef.doc(batchId),{'stock':newquantity});
             }
           }
           else{
             print('there was nothing inside the batch');
           }
           }
          }
        }
     
     else{
      print('there is no document');
     }
  });
  }



  Future<void> addBatch({
    required String branchId,
  required String medicineName,
  required String location,
  required DateTime expiryDate,
  required String batchNumber,
  required int stock,
  required DateTime dateAdded,
}) async {
  final medicineRef = _firebaseFirestore.collection('medicine').doc(medicineName);

  await _firebaseFirestore.runTransaction((transaction) async {
    final medicineSnapshot = await transaction.get(medicineRef);
    if (medicineSnapshot.exists) {
      // Reference the "batches" subcollection
      final batchRef = medicineRef.collection('batches');
      final batchId = batchRef.id;
      // Create a new batch document with the provided data
      final batchData = Batch(
          location: location, expiryDate: expiryDate, batchNumber: batchNumber, stock: stock, dateAdded: dateAdded, batchId: batchId,branchId:branchId)
          .toMap();
      await transaction.set(batchRef.doc(), batchData);
      print('Batch added successfully');
    } else {
      print('Medicine document $medicineName does not exist');
    }
  });
}
}

