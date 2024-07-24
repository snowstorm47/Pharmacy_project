import 'package:flutter/foundation.dart';
import '../data/repositories/branch_repo.dart';
import '../domain/entities/branch.dart';
import '../domain/entities/refill.dart';

class BranchProvider extends ChangeNotifier {
  List<Branch>? _branches = [];
  List<Refill>? _refills = [];

  final RegisterBranch branchService = RegisterBranch();

  List<Branch>? get branches => _branches;
  List<Refill>? get refills => _refills;

  Future<void> getBranches() async {
    _branches = await branchService.getBranches();
    notifyListeners();
  }

  Future<void> addBranch({
    required String BranchEmail,
    required String Address,
    required String phoneNo,
    required int totalEmployees,
    required int storeCapacity,
    required String BranchManager,
    required String Description,
    required String openHours,
    required String BranchName,
  }) async {
    final branch = await branchService.AddBranch(
      BranchEmail: BranchEmail,
      Address: Address,
      phoneNo: phoneNo,
      totalEmployees: totalEmployees,
      storeCapacity: storeCapacity,
      BranchManager: BranchManager,
      Description: Description,
      openHours: openHours,
      BranchName: BranchName,
    );
    if (branch != null) {
      _branches?.add(branch);
      notifyListeners();
    }
  }

  Future<void> deleteBranch(String id) async {
    await branchService.RemoveBranch(id);
    _branches!.removeWhere((branch) => branch.Branch_id == id);
    notifyListeners();
  }

  Future<void> editBranch({required String id, required Map<String, dynamic> NewData}) async {
    await branchService.editBranch(id, updatedData: NewData);
    final index = _branches?.indexWhere((branch) => branch.Branch_id == id);
    if (index != null && index != -1) {
      _branches![index] = Branch.fromMap({..._branches![index].toMap(), ...NewData});
      notifyListeners();
    }
  }

  Future<void> deleteBranches(List<String> ids) async {
    await branchService.deleteBranches(ids);
    for (final branchId in ids) {
      _branches?.removeWhere((branch) => branch.Branch_id == branchId);
    }
    notifyListeners();
  }

  Future<Branch?> getBranch(String id) async {
    final branch = await branchService.getBranch(id);
    return branch;
  }

  Future<void> addRefill({
    required String branchName,
    required String refillRequest,
    required String requestDate,
    required String requestedBy,
  }) async {
    final refillReq = await branchService.addRefill(
      branchName: branchName,
      refillRequest: refillRequest,
      requestDate: requestDate,
      requestedBy: requestedBy,
    );
    if (refillReq != null) {
      _refills?.add(refillReq);
      notifyListeners();
    }
  }

  Future<void> getRefills() async {
    _refills = await branchService.getRefill();
    notifyListeners();
  }

  Future<void> editRefill({required String id, required Map<String, dynamic> NewData}) async {
    await branchService.editRefill(id, updatedData: NewData);
    final index = _refills?.indexWhere((refill) => refill.id == id);
    if (index != null && index != -1) {
      _refills![index] = Refill.fromMap({..._refills![index].toMap(), ...NewData});
      notifyListeners();
    }
  }

  Future<void> deleteRefill(String id) async {
    await branchService.removeRefill(id);
    _refills?.removeWhere((refill) => refill.id == id);
    notifyListeners();
  }
}
