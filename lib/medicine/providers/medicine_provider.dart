
import 'dart:ui';

import 'package:clean_a/medicine/data/repository/medicine_repo.dart';
import 'package:clean_a/medicine/domain/entities/medicine.dart';
import 'package:flutter/foundation.dart';

import '../domain/entities/batch.dart';

class MedicineProvider extends ChangeNotifier{

 List<Medicine>? _medicines=[];
 List<Batch>? _batches=[];
 

 MedicineRepo medService = MedicineRepo();

  List<Medicine>? get medicines => _medicines;
  List<Batch>? get batches =>_batches;
  
 Future<void> addMedicine({
   required medicineName,
  required branchName,
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
 }) async{
  final med = await medService.addMedicine(medicineName: medicineName, branchName: branchName, location: location, catagory: catagory, weight: weight, genericName: genericName, suppliersPrice: suppliersPrice, sellingPrice: sellingPrice, expiryDate: expiryDate, stock: stock, taxable: taxable, prescriptionBased: prescriptionBased, details: details, dateAdded: dateAdded);
  if(med!=null){
    _medicines?.add(med);
    notifyListeners();
  }
 }
 
 Future<void> deleteMedicine({
    required medicineName,
    required branchName,
  })async{

  await medService.deleteMedicince(medicineName: medicineName, branchName: branchName);
  _medicines!.removeWhere((med) => med.medicineName == medicineName && med.branchName == branchName);
  notifyListeners();
  }
  Future<void> editMedicine(String medicineName, {required Map<String,dynamic> updatedData}) async{
    await medService.updateMedicine(medicineName, updatedData: updatedData);
   final index = _medicines?.indexWhere((med) => med.medicineName == medicineName);
   if(index!=null){
    if (index != -1) {
      _medicines?[index] = Medicine.fromMap({..._medicines![index].toMap(), ...updatedData});
      notifyListeners();
    }
   }
  }
  Future<void> addBatch()async{

  }
  Future<Color?> getColor() async{

  }
  Future<void> sellMed()async{

  }
  Future<void> sellCredit() async{
    
  }
  }