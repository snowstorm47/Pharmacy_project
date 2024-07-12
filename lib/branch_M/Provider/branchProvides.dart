

import 'package:clean_a/branch_M/data/repositories/branch_repo.dart';

import 'package:flutter/foundation.dart';

import '../domain/entities/branch.dart';
import '../domain/entities/refill.dart';

class  BranchProvider extends ChangeNotifier{
 
 List<Branch>? _branches=[];
 List<Refill>? _refills=[];

 RegisterBranch branchService = RegisterBranch();

  List<Branch>? get branches => _branches;
  List<Refill>? get refills =>_refills;
  

  Future<void> getBranches()async{
    _branches= await branchService.getBranches();
    notifyListeners();
  }
  Future<void> addBranch({required BranchEmail,required Address,required phoneNo,required totalEmployees,required storeCapacity,required BranchManager,required Description,required openHours,required BranchName}) async{
  final branch =await branchService.AddBranch(BranchEmail: BranchEmail, Address: Address, phoneNo: phoneNo, totalEmployees: totalEmployees, storeCapacity: storeCapacity, BranchManager: BranchManager, Description: Description, openHours: openHours, BranchName: BranchName);
   if(branch != null){
  _branches?.add(branch);
   notifyListeners();
  }
  }
  Future<void> deleteBranch(String id) async{
    await branchService.RemoveBranch(id);
     _branches!.removeWhere((branch) => branch.Branch_id == id);
    notifyListeners();
  }
  Future<void> editBranch({required String id, required Map<String,dynamic> NewData})async{
   await branchService.editBranch(id, updatedData: NewData);
   final index = _branches?.indexWhere((branch) => branch.Branch_id == id);
   if(index!=null){
    if (index != -1) {
      _branches![index] = Branch.fromMap({..._branches![index].toMap(), ...NewData});
      notifyListeners();
    }
   }
  }
  Future<void> deleteBranches(List<String> id)async{
    await branchService.deleteBranches(id);
    for(final brachId in id){
     _branches?.removeWhere((branch) => branch.Branch_id == id);
    }
    notifyListeners();
  }
  Future<Branch?> getBranch (String id) async{
  final branch = await branchService.getBranch(id);
  return branch;
  }
 
  Future<void> addRefiil({  required branchName, required refillRequest,required requestDate, required requestedBy,}) async{
     
     final refilReq= await branchService.addRefill(branchName: branchName, refillRequest: refillRequest, requestDate: requestDate, requestedBy: requestedBy);
      if(refilReq!=null){
     _refills?.add(refilReq);
     notifyListeners();
     }
  }
  Future<void> getRefill(String id) async{
  _refills= await branchService.getRefill();
  notifyListeners();
  }
 
  Future<void> editRefill({required String id, required Map<String,dynamic> NewData})async{
   await branchService.editBranch(id, updatedData: NewData);
   final index = _refills?.indexWhere((refill) => refill.id == id);
   if(index!=null){
    if (index != -1) {
      _refills?[index] = Refill.fromMap({..._refills![index].toMap(), ...NewData});
      notifyListeners();
    }
   }
  }

  Future<void> deleteRefill(String id) async{
  await branchService.removeRefill(id);
  _refills?.removeWhere((refill) => refill.id == id);
  notifyListeners();
  }
  

}