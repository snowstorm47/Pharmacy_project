
import 'package:clean_a/supplier/data/repositry/supplier_repo.dart';

import 'package:flutter/foundation.dart';

import '../domain/entities/supplier.dart';

class SupplierProvider extends ChangeNotifier{

List<Supplier>?  _supplier=[];
supplierRepo supplierService = supplierRepo();
List<Supplier>? get supplier => _supplier;


Future<void> addSupplier(
  {
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
  }
)async{
final suppl= await supplierService.addSupplier(name: name, description: description, email: email, supplies: supplies, paymentTerm: paymentTerm, status: status, phoneNumber: phoneNumber, address: address, subCity: subCity, city: city);
if(suppl!= null){
  _supplier?.add(suppl);
  notifyListeners();
}
}

Future<void> editSupplier(String id,{required Map<String,dynamic> updatedData})async{

  await supplierService.updateSupplier(id, updatedData: updatedData);
    final index = _supplier?.indexWhere((suppl) => suppl.supplierId == id);
   if(index!=null){
    if (index != -1) {
      _supplier![index] = Supplier.fromMap({..._supplier![index].toMap(), ...updatedData});
      notifyListeners();
    }
   }
}
Future<void> getSuppliers()async{
_supplier=await supplierService.getSuppliers();
notifyListeners();
}
Future<void> deleteSupplier(List<String> id)async{
 
 await supplierService.deleteSelected(id);
   for(final supplId in id){
     _supplier?.removeWhere((suppl) => suppl.supplierId == supplId);
    }
    notifyListeners();
}
Future<void> removeSuppliers(String id) async{
await supplierService.removeSuppliers(id);
 _supplier?.removeWhere((suppl) => suppl.supplierId== id);
  notifyListeners();
}
Future<void> contact(String Subject,String body, String id)async{
  await supplierService.sendEmail(Subject:Subject,body:body,id:id);
}

}