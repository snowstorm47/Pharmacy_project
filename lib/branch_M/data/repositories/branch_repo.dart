//class responsible for the branch service


import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/branch.dart';

class RegisterBranch{
  //loading the firebase instances
  final FirebaseFirestore _firebaseFirestore;
  RegisterBranch(this._firebaseFirestore);
    
    
    

//function responsible for returning list of branches 
   Future<List<Object>?> AddBranch({required BranchEmail,required Address,required phoneNo,required totalEmployees,required storeCapacity,required BranchManager,required Description,required openHours,required BranchName})async{
      final CollectionReference branchCollection= _firebaseFirestore.collection('Branch');
    final docRef= branchCollection.doc();
    final Branch_id=docRef.id;
   
    final branchData= Branch(Address: Address, BranchEmail: BranchEmail, BranchManager: BranchManager, BranchName: BranchName, Branch_id: Branch_id, Description: Description, openHours: openHours, phoneNo: phoneNo, storeCapacity: storeCapacity, totalEmployees: totalEmployees);
 
   await branchCollection.doc(Branch_id).set(branchData.toMap());
      return await getBranches();
    
    }
  Future<List<Object>?>  RemoveBranch(Branch_id)async{
     final CollectionReference branchCollection= _firebaseFirestore.collection('Branch');
    await branchCollection.doc(Branch_id).delete();
    return await getBranches(); 
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
  Future <List<Object>?>getBranches()async{
     final CollectionReference branchCollection= _firebaseFirestore.collection('Branch');
    final snapshot = await branchCollection.get();
   return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
  Future<void> deleteCollectionInLoop(List<String> batchId) async {
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
  }


}