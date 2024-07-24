/*import 'package:clean_a/branch_M/data/repositories/refillrepo.dart';
import 'package:flutter/foundation.dart';
import 'package:clean_a/branch_M/data/models/refill_request_data.dart';
//import 'package:clean_a/branch_M/data/repository/refill_repo.dart';

class RefillProvider extends ChangeNotifier {
  List<RefillRequestData>? _refills = [];
  RefillRepo refillRepo = RefillRepo();

  List<RefillRequestData>? get refills => _refills;

  Future<void> getRefills() async {
    _refills = await refillRepo.getRefills();
    notifyListeners();
  }

  Future<void> addRefill({
    required String branchName,
    required String refillRequest,
    required String requestDate,
    required String requestedBy,
  }) async {
    final refill = await refillRepo.addRefill(
      branchName: branchName,
      refillRequest: refillRequest,
      requestDate: requestDate,
      requestedBy: requestedBy,
    );
    if (refill != null) {
      _refills?.add(refill);
      notifyListeners();
    }
  }

  Future<void> updateRefill(String id, {required Map<String, dynamic> updatedData}) async {
    await refillRepo.updateRefill(id, updatedData: updatedData);
    final index = _refills?.indexWhere((refill) => refill.id == id);
    if (index != null && index != -1) {
      _refills![index] = RefillRequestData.fromMap({..._refills![index].toMap(), ...updatedData});
      notifyListeners();
    }
  }

  Future<void> deleteRefill(String id) async {
    await refillRepo.deleteRefill(id);
    _refills?.removeWhere((refill) => refill.id == id);
    notifyListeners();
  }
}
*/