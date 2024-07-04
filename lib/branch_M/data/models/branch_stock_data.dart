import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BranchStockData {
  final String batch;
  final String productName;
  final String category;
  final String price;
  final String expiryDate;
  final String quantity;

  BranchStockData({
    required this.batch,
    required this.productName,
    required this.category,
    required this.price,
    required this.expiryDate,
    required this.quantity,
  });

  static List<BranchStockData> dummyData() {
    return [
      BranchStockData(
        batch: '1013/23',
        productName: 'Medicine A',
        category: 'painkiller',
        price: '100 etb.',
        expiryDate: '23/12/23',
        quantity: '120',
      ),
      BranchStockData(
        batch: '1014/23',
        productName: 'Medicine B',
        category: 'antibiotic',
        price: '200 etb.',
        expiryDate: '23/06/24',
        quantity: '150',
      ),
      BranchStockData(
        batch: '1015/23',
        productName: 'Medicine C',
        category: 'vitamin',
        price: '150 etb.',
        expiryDate: '14/12/23',
        quantity: '100',
      ),
      BranchStockData(
        batch: '1016/23',
        productName: 'Medicine D',
        category: 'vitamin',
        price: '150 etb.',
        expiryDate: '23/07/24',
        quantity: '100',
      ),
      BranchStockData(
        batch: '1017/23',
        productName: 'Medicine E',
        category: 'vitamin',
        price: '150 etb.',
        expiryDate: '14/08/23',
        quantity: '100',
      ),
      BranchStockData(
        batch: '1018/23',
        productName: 'Medicine F',
        category: 'vitamin',
        price: '150 etb.',
        expiryDate: '22/06/24',
        quantity: '100',
      ),
    ];
  }

  Color getStatusColor() {
    final now = DateTime.now();
    final expiry = DateFormat('dd/MM/yy').parse(expiryDate);
    if (expiry.isBefore(now)) {
      return const Color.fromARGB(255, 234, 109, 100); // expired
    } else if (expiry.difference(now).inDays <= 30) {
      return const Color.fromARGB(255, 203, 239, 59); // pending
    } else {
      return const Color.fromARGB(255, 97, 190, 101); // safe
    }
  }
}
