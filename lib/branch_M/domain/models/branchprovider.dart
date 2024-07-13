import 'package:clean_a/branch_M/data/models/branch_list_data.dart';
import 'package:flutter/foundation.dart';
//import 'package:clean_a/branches/data/branch_data.data.dart';

class BranchProvider extends ChangeNotifier {
  List<BranchLD> _branches = [
    // Initial branch data
  ];

  List<BranchLD> get branches => _branches.toList();

  void addBranch(BranchLD branch) {
    _branches.add(branch);
    notifyListeners();
  }

  void updateBranch(String branchId, BranchLD updatedBranch) {
    final index = _branches.indexWhere((b) => b.branchId == branchId);
    if (index != -1) {
      _branches[index] = updatedBranch;
      notifyListeners();
    }
  }

  void deleteBranch(String branchId) {
    _branches.removeWhere((b) => b.branchId == branchId);
    notifyListeners();
  }
}
