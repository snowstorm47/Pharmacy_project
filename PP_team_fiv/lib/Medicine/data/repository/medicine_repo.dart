import 'package:app/Medicine/domain/entities/batch.dart';
import 'package:app/Medicine/domain/entities/medicine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MedicineRepo{
   final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _firebaseFirestore;
  MedicineRepo(this._firebaseFirestore,this._firebaseStorage);
 
Future<void>  AddMedicine(
  {
     required MedicineName,
    required Location,
    required Catagory,
    required weight,
    required GenericName,
    required SuppliersPrice,
    required SellingPrice,
    required ExpiryDate,
    required Stock,
    required Taxable,
    required PrescriptionBased,
    required Details,
    required balance,
    required DateTime dateAdded
  }
  )async{
  
  final CollectionReference MedicineRef = _firebaseFirestore.collection('Medicine');
  final docName = MedicineName;
  final  List<Batch>batchList=[];
  final BatchNumber= dateAdded.toString();
  final batch= Batch(
    Location: Location,
     BatchNumber:BatchNumber, 
     ExpiryDate:ExpiryDate,
      dateAdded: dateAdded, 
      Stock: Stock
           );
     batchList.add(batch);
    final Med = Medicine(
      Catagory: Catagory,
       MedicineName: MedicineName,
        balance: balance,
         weight:weight, 
         batch: batchList,
          Details: Details,
           GenericName:GenericName,
            PrescriptionBased: PrescriptionBased,
             SellingPrice: SellingPrice, 
             SuppliersPrice: SuppliersPrice,
              Taxable: Taxable,     
    );
      await MedicineRef.doc(docName).set(Med);
  }
  Future<void> deleteMedicince({
    required MedicineName,
    required Catagory,
    required Reason,
    required Stock,
    required Details,
  }) async{
 CollectionReference MedRef =  _firebaseFirestore.collection('medicine');
  try{
 QuerySnapshot querysnapshot = await MedRef.where('MedicineName' ,isEqualTo: MedicineName).get();
 if(querysnapshot == null){
  print("the medicine you want to delete doesn't exist");
 }
 else{
  querysnapshot.docs.forEach((doc)async{
    await MedRef.doc(doc.id).delete();
    print("medicine is deleted successfully");
  });
 }
  }catch(e){
    print(e.toString());
  }
  }
Future<void> removeBatch({required MedicineName,required BatchNumber}) async {
  final MedRef = _firebaseFirestore.collection('medicine').doc(MedicineName);
  final batchNum = BatchNumber;
  final transaction = await _firebaseFirestore.runTransaction((transaction)async{
 final docSnapshot = await transaction.get(MedRef);
  if(docSnapshot.exists){
final data = docSnapshot.data();
if(data!=null){
  if(data.containsKey('batch')){
    final List<Batch> batchList = List.from(data['batch'] as List<Batch>);
    batchList.removeWhere((batch)=>batch.BatchNumber== batchNum);
    transaction.update(MedRef,{'batch':batchList});
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

}