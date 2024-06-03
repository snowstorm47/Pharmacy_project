import 'dart:ui';

import 'package:app/Medicine/domain/entities/batch.dart';
import 'package:app/Medicine/domain/entities/medicine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
class MedicineRepo{
   final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _firebaseFirestore;
  MedicineRepo(this._firebaseFirestore,this._firebaseStorage);
 
Future<void>  addMedicine(
  {
     required medicineName,
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
  
  final CollectionReference medRef = _firebaseFirestore.collection('Medicine');
  final docName = medicineName;
  final  List<Batch>batchList=[];
  final batchNumber= dateAdded.toString();
  final batch= Batch(
    location: location,
     batchNumber:batchNumber, 
     expiryDate:expiryDate,
      dateAdded: dateAdded, 
      stock: stock
           );
     batchList.add(batch);
    final med = Medicine(
      catagory: catagory,
       medicineName: medicineName,
         weight:weight, 
         batch: batchList,
          details: details,
           genericName:genericName,
            prescriptionBased: prescriptionBased,
             sellingPrice: sellingPrice, 
             suppliersPrice: suppliersPrice,
              taxable: taxable,     
    );
      await medRef.doc(docName).set(med);
  }
  Future<void> deleteMedicince({
    required medicineName,
    required catagory,
    required reason,
    required stock,
    required details,
  }) async{
 CollectionReference medRef =  _firebaseFirestore.collection('medicine');
  try{
 QuerySnapshot querysnapshot = await medRef.where('MedicineName' ,isEqualTo: medicineName).get();
 if(querysnapshot == null){
  print("the medicine you want to delete doesn't exist");
 }
 else{
  querysnapshot.docs.forEach((doc)async{
    await medRef.doc(doc.id).delete();
    print("medicine is deleted successfully");
  });
 }
  }catch(e){
    print(e.toString());
  }
  }
Future<void> removeBatch({required medicineName,required batchNumber}) async {
  final medRef = _firebaseFirestore.collection('medicine').doc(medicineName);
  final batchNum = batchNumber;
  final transaction = await _firebaseFirestore.runTransaction((transaction)async{
 final docSnapshot = await transaction.get(medRef);
  if(docSnapshot.exists){
final data = docSnapshot.data();
if(data!=null){
  if(data.containsKey('batch')){
    final List<Batch> batchList = List.from(data['batch'] as List<Batch>);
    batchList.removeWhere((batch)=>batch.batchNumber== batchNum);
    transaction.update(medRef,{'batch':batchList});
  }else{
    print("the doc doesn't have the key batch");
  }
}
  }else{
    print('there is no file');
  }
  }); 
 if(transaction!=null){
  print('batch remove successfully');
 }
 else{
  print('falied to remove batch');
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

Future<List<QueryDocumentSnapshot>?>searchMedicine({required String medicineName})async{
 final searchMed = medicineName;
 final medRef = _firebaseFirestore.collection('medicine');
 final query= medRef.where('medicineName', isGreaterThanOrEqualTo: searchMed );
  final querySnapshot = await query.get();
  return querySnapshot.docs;
}

Future<bool> checkExpiry(Batch batch) async{
  DateTime now = DateTime.now();
  Duration oneDay = const Duration(days: 1);
  Duration oneMonth =const  Duration(days: 30); 
  // Assuming 30 days per month

  // Calculate minimum and maximum expiry dates within the range
  DateTime minExpiryDate = now.add(oneDay);
  DateTime maxExpiryDate = now.add(oneMonth);
  
        if(batch.expiryDate == DateTime.now()){
          return true;
        }
        if(batch.expiryDate.isAtSameMomentAs(minExpiryDate) ||
         batch.expiryDate.isAfter(minExpiryDate) &&batch.expiryDate.isBefore(maxExpiryDate.add(oneDay))){
        
           return false;
         }
         else{
          return false;
         }
}

Future<Color?> colorCoding(String batchNum,String medicineName) async{
   final searchItem = batchNum;
   final med = medicineName;
   final medRef = _firebaseFirestore.collection('medicine');
   final document = medRef.doc(med);
  DateTime now = DateTime.now();
  Duration oneDay = const Duration(days: 1);
  Duration oneMonth = const Duration(days: 30); 
  // Assuming 30 days per month

  // Calculate minimum and maximum expiry dates within the range
  DateTime minExpiryDate = now.add(oneDay);
  DateTime maxExpiryDate = now.add(oneMonth);

   final transaction = await _firebaseFirestore.runTransaction((transaction)async{
 final docSnapshot = await transaction.get(document);
  if(docSnapshot.exists){
final data = docSnapshot.data();
if(data!=null){
  if(data.containsKey('batch')){
    final List<Batch> batchList = List.from(data['batch'] as List<Batch>);
     for(Batch batch in batchList){
       if(batch.batchNumber == searchItem){
        if(batch.expiryDate == DateTime.now()){
          Color color =  Colors.red;
          return color;
        }
        if(batch.expiryDate.isAtSameMomentAs(minExpiryDate) ||
         batch.expiryDate.isAfter(minExpiryDate) &&batch.expiryDate.isBefore(maxExpiryDate.add(oneDay))){
           Color color = Colors.yellow;
           return color;
         }
         else{
          Color color = Colors.green;
          return color;
         }

       }
     }
  }else{
    print("the doc doesn't have the batch");
  }
}
  }else{
    print('there is no file');
  }
  });
   return null;
 


}  

Future<void> sellItem(String medicineName, int quantityToSell) async {
  final itemRef = _firebaseFirestore.collection('medicine').doc(medicineName);

  await _firebaseFirestore.runTransaction((transaction) async {
    final itemSnapshot = await transaction.get(itemRef);
    if (!itemSnapshot.exists) {
      // Handle the case where the item doesn't exist
      return;
    }

    final itemData = itemSnapshot.data()!;
    final batches = itemData['batch'] as List<Batch>;

    if (batches.isEmpty) {
      // Handle the case where there are no batches
      return;
    }

    final firstBatchQuantity = batches.first;
   
    if (firstBatchQuantity.stock < quantityToSell) {
      // Handle the case where not enough items are available
    
      for(Batch batch in  batches){
          if(batch.stock > quantityToSell){
    final newQuantity = batch.stock - quantityToSell;
          if(newQuantity == 0){
      batches.remove(batch);
            }
    transaction.update(itemRef, {
      'batch': [newQuantity, ...batches.sublist(1)],
    });
          return;
          }
          else{
            for(Batch batch in batches){
              int cumulativeStock=0;
              cumulativeStock += batch.stock;
                if(cumulativeStock >= quantityToSell){
               
            }
            }
          
          }
      }
      return null;
    }

    final newQuantity = firstBatchQuantity.stock - quantityToSell;
    transaction.update(itemRef, {
      'batch': [newQuantity, ...batches.sublist(1)],
    });
  });
}
Future<void> addBatch(
  {
    required medicineName,
    required location,
    required expiryDate,
    required batchNumber,
    required stock,
    required dateAdded,
  }
)async{
  final medRef= _firebaseFirestore.collection('medicine').doc(medicineName);
  final batch= Batch(location: location, expiryDate: expiryDate, batchNumber: batchNumber, stock: stock, dateAdded: dateAdded);
  
 final transaction = await _firebaseFirestore.runTransaction((transaction)async{
 final docSnapshot = await transaction.get(medRef);
  if(docSnapshot.exists){
  final data = docSnapshot.data();
if(data!=null){
  if(data.containsKey('batch')){
    final List<Batch> batchList = List.from(data['batch'] as List<Batch>);
    batchList.add(batch);
    transaction.update(medRef,{'batch':batchList});
  }else{
    print("the doc doesn't have the key batch");
  }
}
  }else{
    print('there is no file');
  }
  }); 
 if(transaction!=null){
  print('batch added successfully');
 }
 else{
  print('falied to added batch');
 }

}

}