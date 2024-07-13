import 'package:flutter/material.dart';
import 'package:clean_a/medicine/data/medicine_data.data.dart';

class MedicineProvider extends ChangeNotifier {
  List<DataMD> _medicines = [
    // Your initial list of medicines
  ];

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
    _medicines.removeWhere((m) => m.id == medicine.id);
    notifyListeners();
  }
}
