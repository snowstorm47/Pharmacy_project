
import 'package:clean_a/settings/domain/entities/role.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SettingRepo{
  FirebaseFirestore _firebaseFirestore;
  SettingRepo(this._firebaseFirestore);
 
 Future<void> addRole({
  required String name,
  required List<String> actions,
  required List<String> access,
  required String employeeName,
  required String description
 }) async{
  final employeeRef = _firebaseFirestore.collection('Employees');
  final query = employeeRef.where('FirstName',isEqualTo: employeeName).limit(1);
 //Get documents
 final querySnapshot = await query.get();
 if(querySnapshot.docs.length > 1){
 final role= Role(
    employeeName: employeeName,
    name:name,
    actions: actions,
    access: access,
    description: description
  );
  if(role!= null){
  final roleRef =  _firebaseFirestore.collection('role').doc(employeeName).set(role.toMap());
 }
 }
 else{
 print('there is not employee with employeeName ${employeeName}');
 return null;
 }

 
 }
 Future<void> editRole(String employeeName, {required Map<String, dynamic> updatedData}) async {
  final roleRef = _firebaseFirestore.collection('role').doc(employeeName);
 

  // Transaction for data consistency
  await _firebaseFirestore.runTransaction((transaction) async {
    try {
      final documentSnapshot = await transaction.get(roleRef);

      if (!documentSnapshot.exists) {
        throw Exception(' $employeeName not found'); // Handle non-existent employee
      }

      // Update only specified fields (prevents overwriting entire document)
      final existingData = documentSnapshot.data()!;
      existingData.updateAll((key, value) => updatedData.containsKey(key) ? updatedData[key] : value);

      transaction.set(roleRef, existingData);
    } catch (error) {
      // Handle the error here, log it, or re-throw for caller handling
      print('Error editing branch: $error');
      // rethrow; // Optional: Re-throw for caller handling
    }
  });
}

  Future <List<Object>?>getRoles()async{
     final CollectionReference roleCollection= _firebaseFirestore.collection('role');
    final snapshot = await roleCollection.get();
   return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
Future<void> deleteRole(List<String> employeeName) async {
  final roleRef = _firebaseFirestore.collection('role');
   final batch = _firebaseFirestore.batch();
  for (final id in employeeName) {
    batch.delete(roleRef.doc(id));
  }
  await batch.commit();
}


  
}