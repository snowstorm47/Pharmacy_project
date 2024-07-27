import 'package:clean_a/supplier%20copy/data/repositry/supplier_repo.dart';
import 'package:clean_a/supplier%20copy/domain/entities/supplier.dart';
//import 'package:clean_a/supplier/data/repositry/supplier_repo.dart';
//import 'package:clean_a/supplier/domain/entities/supplier.dart';
import 'package:flutter/foundation.dart';
/*import 'supplier_repo.dart';
import 'supplier.dart';*/

class SupplierProvider extends ChangeNotifier {
  List<Supplier>? _supplier = [];
  supplierRepo supplierService = supplierRepo();
  List<Supplier>? get supplier => _supplier;

  Future<void> addSupplier({
    required String name,
    required String description,
    required String email,
    required String supplies,
    required String paymentTerm,
    required String status,
    required String phoneNumber,
    required String address,
    required String subCity,
    required String city,
  }) async {
    final suppl = await supplierService.addSupplier(
      name: name,
      description: description,
      email: email,
      supplies: supplies,
      paymentTerm: paymentTerm,
      status: status,
      phoneNumber: phoneNumber,
      address: address,
      subCity: subCity,
      city: city,
    );
    if (suppl != null) {
      _supplier?.add(suppl);
      notifyListeners();
    }
  }

  Future<void> editSupplier(String id, {required Map<String, dynamic> updatedData}) async {
    await supplierService.updateSupplier(id, updatedData: updatedData);
    final index = _supplier?.indexWhere((suppl) => suppl.supplierId == id);
    if (index != null && index != -1) {
      _supplier![index] = Supplier.fromMap({..._supplier![index].toMap(), ...updatedData});
      notifyListeners();
    }
  }

  Future<void> getSuppliers() async {
    _supplier = await supplierService.getSuppliers();
    notifyListeners();
  }

  Future<void> deleteSupplier(List<String> id) async {
    await supplierService.deleteSelected(id);
    for (final supplId in id) {
      _supplier?.removeWhere((suppl) => suppl.supplierId == supplId);
    }
    notifyListeners();
  }

  Future<void> removeSuppliers(String id) async {
    await supplierService.removeSuppliers(id);
    _supplier?.removeWhere((suppl) => suppl.supplierId == id);
    notifyListeners();
  }

  /*Future<void> contact(String subject, String body, String id) async {
    await supplierService.sendEmail(subject: subject, body: body, id: id, Subject: '');
  }*/
  Future<void> contact(String subject, String body, String id) async {
  await supplierService.sendEmail(
    subject: subject,
    body: body,
    id: id,
    Subject: '',
  );
}

}
