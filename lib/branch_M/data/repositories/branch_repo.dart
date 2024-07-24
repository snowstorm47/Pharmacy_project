//class responsible for the branch service


import 'package:clean_a/branch_M/domain/entities/refill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/branch.dart';

class RegisterBranch{
  //loading the firebase instances
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
 
    
    
    

//function responsible for returning list of branches 
   Future<Branch?> AddBranch({required BranchEmail,required Address,required phoneNo,required totalEmployees,required storeCapacity,required BranchManager,required Description,required openHours,required BranchName})async{
      final CollectionReference branchCollection= _firebaseFirestore.collection('Branch');
    final docRef= branchCollection.doc();
    final Branch_id=docRef.id;
   
    final branchData= Branch(Address: Address, BranchEmail: BranchEmail, BranchManager: BranchManager, BranchName: BranchName, Branch_id: Branch_id, Description: Description, openHours: openHours, phoneNo: phoneNo, storeCapacity: storeCapacity, totalEmployees: totalEmployees);
 
   await branchCollection.doc(Branch_id).set(branchData.toMap());
   return branchData;
    
    
    }
  Future<void>  RemoveBranch(Branch_id)async{
     final CollectionReference branchCollection= _firebaseFirestore.collection('Branch');
    await branchCollection.doc(Branch_id).delete();
 
 }
  Future<void> editBranch(String branchId, {required Map<String, dynamic> updatedData}) async {
  final collectionReference = _firebaseFirestore.collection('Branch');
  final document = collectionReference.doc(branchId);

  // Transaction for data consistency
  await _firebaseFirestore.runTransaction((transaction) async {
    final documentSnapshot = await transaction.get(document);

    if (!documentSnapshot.exists) {
      throw Exception('Employee with ID: $branchId not found'); // Handle non-existent employee
    }

    // Update only specified fields (prevents overwriting entire document)
    final existingData = documentSnapshot.data()!;
    existingData.updateAll((key, value) => updatedData.containsKey(key) ? updatedData[key] : value);

    transaction.set(document, existingData);
  });}
Future<List<Branch>?> getBranches() async {
  final CollectionReference branchCollection = _firebaseFirestore.collection('Branch');
  final snapshot = await branchCollection.get();
  return snapshot.docs.map((doc) {
    return Branch.fromMap(doc.data() as Map<String, dynamic>);
  }).toList();
}

  Future<void> deleteBranches(List<String> batchId) async {
  final batchRef = _firebaseFirestore.collection('Branch');
   final batch = _firebaseFirestore.batch();
  for (final id in batchId) {
    batch.delete(batchRef.doc(id));
  }
  await batch.commit();
}
 Future<Branch?> getBranch(String Branch_Id)async{
    final branchRef = _firebaseFirestore.collection('Branch').doc(Branch_Id);
    final snapShot = await branchRef.get();
    if(snapShot!= null){
      return Branch.fromMap(snapShot.data() as Map<String,dynamic>);
    }
    return null;
  }
 
 Future<Refill?> addRefill({  required branchName, required refillRequest,required requestDate, required requestedBy,}) async{
  final refillRef = _firebaseFirestore.collection('refill');
  final docRef = refillRef.doc().id;

  final refill = Refill(
    id:docRef,
    branchName:branchName,
    refillRequest:refillRequest,
    requestedBy:requestedBy,
    requestDate:requestDate
  );
  await refillRef.doc(docRef).set(refill.toMap());
  return refill;
 }
   Future <List<Refill>?>getRefill()async{
     final CollectionReference refillCollection= _firebaseFirestore.collection('refill');
    final snapshot = await refillCollection.get();
     return snapshot.docs.map((doc) {
    return Refill.fromMap(doc.data() as Map<String, dynamic>);
  }).toList();
  }
   Future<void> removeRefill(String id)async{
     final CollectionReference refillCollection= _firebaseFirestore.collection('refill');
    await refillCollection.doc(id).delete();  
 }
 Future<void> editRefill(String id, {required Map<String, dynamic> updatedData}) async {
  final collectionReference = _firebaseFirestore.collection('refill');
  final document = collectionReference.doc(id);

  // Transaction for data consistency
  await _firebaseFirestore.runTransaction((transaction) async {
    final documentSnapshot = await transaction.get(document);

    if (!documentSnapshot.exists) {
      throw Exception('Request Not Found not found'); // Handle non-existent employee
    }

    // Update only specified fields (prevents overwriting entire document)
    final existingData = documentSnapshot.data()!;
    existingData.updateAll((key, value) => updatedData.containsKey(key) ? updatedData[key] : value);

    transaction.set(document, existingData);
  });}


}