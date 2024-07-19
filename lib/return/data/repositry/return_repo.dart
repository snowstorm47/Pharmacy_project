
import 'package:clean_a/return/domain/entities/disposed.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisposedRepo{
  final FirebaseFirestore _firebaseFirestore= FirebaseFirestore.instance;

Future<Disposed?> addDisposed({
  required String batchId,
  required String medicineName,
  required String reason,
}) async {
  final dateAdded = DateTime.now();
  try {
    final medRef =await _firebaseFirestore.collection('medicine').doc(medicineName).get();
    final doc = await _firebaseFirestore.collection('batches').doc(batchId).get();

    if (doc.exists) {
      final medicine = doc.data()! as Map<String, dynamic>;
      print('Medicine data: $medicine');
      final med=medRef.data()! as Map<String,dynamic>;
      final disposed = Disposed(
        batchId: batchId,
        medicineName: medicineName,
        catagory: med['catagory'],
        genericName: med['genericName'],
        sellingPrice: medicine['sellingPrice'].toString(),
        reason: reason,
        expiryDate: medicine['expiryDate'].toDate(), // Convert Firestore timestamp to DateTime
        dateAdded: dateAdded,
      );
      await _firebaseFirestore.collection('batch').doc(batchId).delete();
      await _firebaseFirestore.collection('disposed').doc(batchId).set(disposed.toMap());
      print('Disposed added: ${disposed.toMap()}');
      return disposed;
    } else {
      print('Document does not exist for batchId: $batchId');
    }
  } catch (e) {
    print('Error: ${e.toString()}');
  }
  return null;
}


 Future<void> removeDisposed(String batchId)async{
  final batchRef =  _firebaseFirestore.collection('disposed').doc(batchId);
  if(batchRef != null){
    await batchRef.delete();
  }else{
    print('there is no document');
  }
 }
 Future<void> deleteManyDisposed(List<String> batchId) async{
     final batchRef = await _firebaseFirestore.collection('disposed');
     final batch = _firebaseFirestore.batch();
     for(String id in batchId){
        batch.delete(batchRef.doc(id));
     }
     batch.commit();
 } 
 Future<List<Disposed>?> getDisposed() async{
   CollectionReference disposedRef = await _firebaseFirestore.collection('disposed');
     final snapshot = await disposedRef.get();
     return snapshot.docs.map((doc) => Disposed.fromMap(doc.data() as Map<String, dynamic>)).toList();
 }
}