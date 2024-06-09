

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/disposed.dart';

class DisposedRepo{
  final FirebaseFirestore _firebaseFirestore;
  DisposedRepo( this._firebaseFirestore);

  Future<void> addDisposed({required String batchId,required String medicineName,required String reason})async{
  final dateAdded = DateTime.now();
  try{
  final medRef =  _firebaseFirestore.collection('medicine').doc(medicineName);
  final doc = await medRef.collection('batches').doc(batchId).get();
  
  final medicine =  doc.data();
   if(medicine!=null){
    final disposed = Disposed(
              batchId: batchId, 
              medicineName: medicineName,
              catagory: medicine['catagory'],
              genericName: medicine['genericName'],
              sellingPrice: medicine['sellingPrice'],
              reason: reason, dateAdded: dateAdded
          );
          //fill the collection with disposed 
          await _firebaseFirestore.collection('disposed').doc(batchId).set(disposed.toMap());
   }else{
    print('there is no document');
   }
  
  }
  catch(e){
    print(e.toString());
  }
 }

 Future<void> removeDisposed(String batchId)async{
  final batchRef = await _firebaseFirestore.collection('disposed').doc('batchId');
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
 Future<List<Object>?> getDisposed() async{
   CollectionReference disposedRef = await _firebaseFirestore.collection('disposed');
     final snapshot = await disposedRef.get();
   return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
 }
}