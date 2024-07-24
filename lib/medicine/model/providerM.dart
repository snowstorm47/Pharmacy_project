

import 'package:clean_a/medicine/data/medicine_data.data.dart';
import 'package:flutter/material.dart';

class MedicineProvider extends ChangeNotifier {
  List<DataMD> _medicines = [];

  List<DataMD> get medicines => _medicines;

  void addMedicine(DataMD medicine) {
    _medicines.add(medicine);
    notifyListeners();
  }

  void updateMedicine(DataMD updatedMedicine) {
    final index = _medicines.indexWhere((medicine) => medicine.id == updatedMedicine.id);
    if (index != -1) {
      _medicines[index] = updatedMedicine;
      notifyListeners();
    }
  }

  void deleteMedicine(DataMD medicine) {
    _medicines.removeWhere((item) => item.id == medicine.id);
    notifyListeners();
  }
}
