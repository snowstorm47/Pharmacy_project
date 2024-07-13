import 'package:clean_a/return/data/disposed_data.dart';
import 'package:flutter/material.dart';
//import 'package:your_app/models/disposed_list_data.dart'; // Adjust import path as per your project structure

class DisposedListProvider with ChangeNotifier {
  List<DisposedListData> _disposedItems = [
    DisposedListData(
      batch: '001',
      productName: 'Product A',
      category: 'Category X',
      price: '100',
      date: '2023-01-01',
      expiryDate: '2024-01-01',
    ),
    DisposedListData(
      batch: '002',
      productName: 'Product B',
      category: 'Category Y',
      price: '150',
      date: '2023-02-01',
      expiryDate: '2024-02-01',
    ),
  ];

  List<DisposedListData> get disposedItems => _disposedItems.toList();

  void addDisposedItem(DisposedListData newItem) {
    _disposedItems.add(newItem);
    notifyListeners();
  }

  void updateDisposedItem(DisposedListData updatedItem) {
    final index =
        _disposedItems.indexWhere((item) => item.batch == updatedItem.batch);
    if (index != -1) {
      _disposedItems[index] = updatedItem;
      notifyListeners();
    }
  }

  void deleteDisposedItem(DisposedListData itemToDelete) {
    _disposedItems.removeWhere((item) => item.batch == itemToDelete.batch);
    notifyListeners();
  }
}
