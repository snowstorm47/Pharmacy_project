import 'package:app/supplier/domain/entities/supplier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';


class supplierRepo{
  FirebaseFirestore _firebaseFirestore;
  supplierRepo(this._firebaseFirestore);

  Future<void> addSupplier({
     required name,
     required description,
     required email,
     required supplies,
     required paymentTerm,
     required status,
     required phoneNumber,
     required address,
     required subCity,
     required city
  })async{

  final supplierRef = _firebaseFirestore.collection('suppliers');
  final supplierId = supplierRef.doc().id;
  final supplier = Supplier(name: name, city: city, address: address, description: description, email: email, paymentTerm: paymentTerm, phoneNumber: phoneNumber, status: status, subCity: subCity, supplies: supplies, supplierId: supplierId);
  await supplierRef.doc(supplierId).set(supplier.toMap());
  }

   Future<List<Object>?>  removeSuppliers(String id)async{
     final CollectionReference supplierCollection= _firebaseFirestore.collection('suppliers');
    await supplierCollection.doc(id).delete();
    return await getSuppliers(); 
 }
   Future <List<Object>?>getSuppliers()async{
     final CollectionReference supplierCollection= _firebaseFirestore.collection('suppliers');
    final snapshot = await supplierCollection.get();
   return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

Future<void> updateSupplier( String id, {required Map<String,dynamic> updatedData}) async{

final supplierRef =_firebaseFirestore.collection('suppliers');
final document = supplierRef.doc(id);
await _firebaseFirestore.runTransaction((transaction) async {
  final docSnapshot = await transaction.get(document);
  if(!docSnapshot.exists){
   throw Exception ("the document doesn't exist");
  }
  final existingData = docSnapshot.data()!;
  existingData.updateAll((key,value)=> updatedData.containsKey(key)? updatedData[key] : value);
  transaction.set( document,existingData);
});
}
Future<void> sendEmail({
  required String Subject,
  required String  body,
  required id,
}
)async{
final supplierRef = _firebaseFirestore.collection('suppliers');
final doc = supplierRef.doc(id);
 if(doc!= null){
  final supplierData = await doc.get();
  final supplierEmail= supplierData['email'];
  try{
  String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: '$supplierEmail',
    query: encodeQueryParameters(<String, String>{
      'subject': '$Subject',
      'body':'$body',
    }),
  );
  
  launchUrl(emailLaunchUri);}
  catch(e){
    print(e.toString());
  }

 }else{
  print("error cannot obtain the document");
 }
}

Future<void> deleteSelected(List<String> supplierId) async {
  final supplierRef = _firebaseFirestore.collection('suppliers');
  final batch = _firebaseFirestore.batch();
  for (final id in supplierId) {
    batch.delete(supplierRef.doc(id)); 
  }
  await batch.commit();
}

}