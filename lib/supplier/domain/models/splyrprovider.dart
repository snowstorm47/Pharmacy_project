import 'package:flutter/material.dart';
import 'package:clean_a/shared/constants/dataS.dart'; // Ensure this import matches your DataS model
//import 'package:clean_a/shared/provider/message_provider.dart'; // Import your MessageProvider

class SupplierProvider extends ChangeNotifier {
  List<DataS> _suppliers = [
    // Your initial list of suppliers
  ];

  List<DataS> get suppliers => _suppliers;

  void addSupplier(DataS supplier) {
    _suppliers.add(supplier);
    notifyListeners();
  }

  void updateSupplier(DataS updatedSupplier) {
    final index =
        _suppliers.indexWhere((supplier) => supplier.supplierId == updatedSupplier.supplierId);
    if (index != -1) {
      _suppliers[index] = updatedSupplier;
      notifyListeners();
    }
  }

  void deleteSupplier(DataS supplier) {
    _suppliers.removeWhere((s) => s.supplierId == supplier.supplierId);
    notifyListeners();
  }

  // Method to add a message to a supplier
  void addMessageToSupplier(DataS supplier, String content) {
    // Replace with your actual logic to add message to the supplier
    // For demonstration purposes, we'll just print the message content
    print('Added message to supplier ${supplier.name}: $content');
    
    // Example: Updating supplier's message list
    // supplier.messages.add(content);

    // Notify listeners if necessary
    notifyListeners();
  }
}
