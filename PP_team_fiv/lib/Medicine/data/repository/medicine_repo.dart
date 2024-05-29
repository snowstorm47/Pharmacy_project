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
  }
  )async{
  
  final CollectionReference MedicineRef = _firebaseFirestore.collection('Medicine');
  final medicineId = MedicineRef.doc().id;
  final MedicineData = Medicine(
    Location:Location,
    MedicineName:MedicineName,
    MedicineId:medicineId,
    Catagory:Catagory,
    weight:weight,
    GenericName:GenericName,
    SuppliersPrice:SuppliersPrice,
     SellingPrice:SellingPrice,
    ExpiryDate:ExpiryDate,
    Taxable:Taxable,
    PrescriptionBased:PrescriptionBased,
     Details:Details,
     Stock:Stock
  );
  await MedicineRef.doc(medicineId).set(MedicineData.toMap());
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

}