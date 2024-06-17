

import 'package:app/Medicine/domain/entities/batch.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';


class MedicineRepo{

  final FirebaseFirestore _firebaseFirestore;
  MedicineRepo(this._firebaseFirestore);
 
Future<void> addMedicine({
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
  required DateTime dateAdded,
}) async {

  final CollectionReference medRef = _firebaseFirestore.collection('medicine');
  final docName = medicineName;
  final batchNumber = dateAdded.toString();
  final batchRef = _firebaseFirestore.collection('batches').doc(docName);
  final batch = Batch(
      location: location,
      expiryDate: expiryDate,
      batchNumber: batchNumber,
      stock: stock,
      dateAdded: dateAdded,
      branchId: branchId);

  try {
    // Attempt to set data in both collections
    await batchRef.set(batch.toMap());
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
      'branchId': branchId,
    });
    print('Medicine added successfully!');
  } on FirebaseException catch (e) {
    // Handle Firebase errors gracefully, e.g., log the error or display a user-friendly message
    print('Error adding medicine: $e');
  } catch (e) {
    // Handle other unexpected errors
    print('An unexpected error occurred: $e');
  }
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
 final batchRef = _firebaseFirestore.collection('batches');
// Create a query to find the product document with matching name (doc ID) and store ID
final query = medRef
  .where('medicineName', isEqualTo: medicineName)
  .where('branchId', isEqualTo: branchId); 
  final batchQuery = batchRef.where('medicineName',isEqualTo:medicineName).where('brancId',isEqualTo:branchId); // Name matches doc ID

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
 final batchfuture = batchQuery.get().then((querySnapshot) {
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
batchfuture.then((_)=>print('batch deleted successfully')).catchError((error) => print('Error deleting product: $error'));
  
future.then((_) => print('Product deleted successfully')).catchError((error) => print('Error deleting product: $error'));
  }
Future<void> removeBatch({required medicineName,required batchid,required branchId}) async {

  final CollectionReference batchRef = _firebaseFirestore.collection('batches');

  try {
    // Create a reference to the specific batch document
    
    final query = batchRef
  .where('medicineName', isEqualTo: medicineName)
  .where('branchId', isEqualTo: branchId);  // Name matches doc ID

 await query.get().then((querySnapshot) {
  if (querySnapshot.docs.isNotEmpty) {
    // Get the document reference from the first document (assuming there should be only one)
    final docRef = querySnapshot.docs.first.reference;
    // Delete the document
    
    docRef.delete();
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
     return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  });
}


Future<bool> checkExpiry(String medicineName)async{
 


  try {
    // Create a reference to the specific batch document
    final batchRef = _firebaseFirestore.collection('batches').doc(medicineName);

    final docSnapshot = await batchRef.get();

    if (docSnapshot.exists) {
      final batchData = docSnapshot.data()!;
      final expiryDate = batchData['expiryDate'] as Timestamp;
       
      // Check if expiry date has passed
      return expiryDate.toDate().isBefore(DateTime.now());
    } else {
      // Handle case where batch document doesn't exist
      print('Batch "$medicineName" not found in medicine "$medicineName".');
      return false; // Or handle differently based on your logic
    }
  } catch (error) {
    // Handle potential errors (e.g., document not found, network issues)
    print('Error checking batch expiry: $error');
    return false; // Or handle differently based on your logic
  }


}

Future<Color?> colorCoding(String batchNum,String medicineName) async{
   final med = medicineName;

   final batchRef = _firebaseFirestore.collection('batches').doc(med);
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
              final difference = expiryDate.difference(now);
              if (difference.inDays == 0) {
                
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
Future<double?> sellItem(String medicineName, int quantityToSell) async {
  // Input validation
  if (medicineName.isEmpty || quantityToSell <= 0 ) {
    throw ArgumentError('Invalid input: medicineName, quantityToSell, and branchId must be provided.');
  }

  try {
    final batchRef = _firebaseFirestore.collection('batches').doc(medicineName);
    final docSnapshot = await batchRef.get();

    if (docSnapshot.exists) {
      final batchData = docSnapshot.data()!;
      final int stock = batchData['stock'] as int;
      final double price = batchData['sellingPrice'] as double;
      final tax = batchData['taxable'] as bool;
    const  taxVariable =0.15;

      if (quantityToSell > 0 && stock >= quantityToSell) {
        final newStock = stock - quantityToSell;
        if(tax){
          await batchRef.update({'stock': newStock});
          var total=  price*0.15;
          return total;
        }
        else{
          await batchRef.update({'stock': newStock});
         var total = price *quantityToSell;
         return total;
         }
      
        
      } else {
        print('Insufficient stock for $medicineName. Only $stock units available.');
      }
    } else {
      print('Batch document for branch $medicineName not found.');
    }
  } on FirebaseException catch (e) {
    // Handle Firebase errors gracefully, e.g., log the error or display a user-friendly message
    print('Error selling item: $e');
  } catch (e) {
    // Handle other unexpected errors
    print('An unexpected error occurred: $e');
  }
}

Future<double?> sellCredit(String medicineName,String company,String customerName,int quantityToSell )async{

final companyRef = _firebaseFirestore.collection('Customer').doc(company);
final batchRef = _firebaseFirestore.collection('batches').doc(medicineName);
final med = await batchRef.get();
const taxVariable = 0.15;
if(med != null){
  final medData = med.data() as Map<String,dynamic>;
  if(medData['quantity'] >= quantityToSell ){
await _firebaseFirestore.runTransaction((transaction)async{
 final snapshot = await transaction.get(companyRef);
 if(snapshot.exists){
  final employeeRef = companyRef.collection('corporateEmployees').doc(customerName);
  final employeeSnapshot = await employeeRef.get();
  if(employeeSnapshot!=null){
    final companyData = snapshot.data() as Map<String,dynamic>;
    final employeeData = employeeSnapshot.data() as Map<String,dynamic>;
    final creditLimit = companyData['creditLimit'] as double;
    if(creditLimit >= medData['sellingPrice']){
      if(med['taxable']){
          final newCreditLimit = creditLimit - medData['sellingPrice']* taxVariable*quantityToSell;
          final newCredit=employeeData['credit']+med['sellingPrice']*taxVariable*quantityToSell; 
          final newStock = medData['stock']-quantityToSell;
          try{ await batchRef.update({'stock': newStock});
           await employeeRef.update({'credit':newCredit});
           await companyRef.update({'creditLimit':newCreditLimit});
          return medData['sellingPrice']*taxVariable*quantityToSell;}
          catch(e){
            print(e.toString());
            return null;
          }
      }
      else{
          final newCreditLimit = creditLimit - medData['sellingPrice']*quantityToSell;
          final newCredit = employeeData['credit'] + med['sellingPrice']*quantityToSell;
          final newStock = medData['stock']-quantityToSell;
          try{
           await batchRef.update({'stock': newStock});
           await employeeRef.update({'credit':newCredit});
           await companyRef.update({'creditLimit':newCreditLimit});
           return med['sellingPrice']*quantityToSell;
           }
           catch(e){
            print(e.toString);
            return null;
           }
          
      }
    
    }
  }
 }

});}
    else{
       throw Exception("there isn't enough quantity");
    }}
    else{
      throw Exception("the medicine doesn't exist");
      
    }
return null;

} 
Future<void> getInfo(List<String> medicineName)async{
List<String > itemName =medicineName;
for(final item in itemName){
  final ref= _firebaseFirestore.collection('batches').doc(item);

}
}

 Future<void> addBatch(String medicineName,
  {required Map<String, dynamic> updatedData}) async {

    final batchRef = _firebaseFirestore.collection('batches').doc(medicineName);
 

  // Transaction for data consistency
  await _firebaseFirestore.runTransaction((transaction) async {
    try {
      final documentSnapshot = await transaction.get(batchRef);

      if (!documentSnapshot.exists) {
        throw Exception('Branch with ID: $medicineName not found'); // Handle non-existent employee
      }
      // Update only specified fields (prevents overwriting entire document)
      final existingData = documentSnapshot.data()!;
      existingData.updateAll((key, value) => updatedData.containsKey(key) ? updatedData[key] : value);
      transaction.set(batchRef, existingData);
    } catch (error) {
      // Handle the error here, log it, or re-throw for caller handling
      print('Error editing branch: $error');
      // rethrow; // Optional: Re-throw for caller handling
    }
  });
}

}

