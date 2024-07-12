
import 'dart:ui';

import 'package:clean_a/medicine/data/repository/medicine_repo.dart';
import 'package:clean_a/medicine/domain/entities/medicine.dart';
import 'package:flutter/foundation.dart';

import '../domain/entities/batch.dart';

class MedicineProvider extends ChangeNotifier{

 List<Medicine>? _medicines=[];
 List<Batch>? _expired=[];
 List<Batch>? _outofStock=[];
 double? _price=0;
 List<Batch>? _batches=[];
 

 MedicineRepo medService = MedicineRepo();

  List<Medicine>? get medicines => _medicines;
  List<Batch>? get batches =>_batches;
   List<Batch>? get expired=> _expired;
    List<Batch>? get outofStock => _outofStock;
  
  double? get price => _price;
  
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
  final batchNumber= dateAdded.toString();
  final newBatch=Batch(
      location: location,
      expiryDate: expiryDate,
      batchNumber: batchNumber,
      stock: stock,
      dateAdded: dateAdded,
      branchName:branchName,
      sellingPrice:sellingPrice,
      suppliersPrice:suppliersPrice,
      taxable:taxable);
  if(med!=null){
    _medicines?.add(med);
    _batches?.add(newBatch);
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

  Future<void> addMed()async{

  }
  Future<void> editBatch(String medicineName,{required Map<String,dynamic> updateData})async{
   await medService.addBatch(medicineName, updatedData: updateData);
   final index = _medicines?.indexWhere((med) => med.medicineName == medicineName);
   if(index!=null){
    if (index != -1) {
      _medicines?[index] = Medicine.fromMap({..._medicines![index].toMap(), ...updateData});
      notifyListeners();
    }

  }
  }
  Future<Color?> getColor(String medicineName) async{
   Color? coloring =await medService.colorCoding(medicineName);
   return coloring;
  }
  Future<void> sellMed(String medicineName,int quantityToSell)async{
   _price =await medService.sellItem(medicineName, quantityToSell);


  }
  Future<void> sellCredit(String medicineName,int quantityToSell,String companyName,String customerName)async{  
    _price= await medService.sellCredit(medicineName, companyName, customerName, quantityToSell);
    
  }

  Future<void> getExpired()async{
   final arr = await medService.getExpiredMed();
   
   if(arr!.isNotEmpty){
      _expired?.addAll(arr);
      notifyListeners();
   }
  }
  
  Future<void> getOutofStock()async{
    final arr = await medService.getOutofStock();
    if(arr!.isNotEmpty){
      _outofStock?.addAll(arr);
      notifyListeners();
    }
  }
  
  }