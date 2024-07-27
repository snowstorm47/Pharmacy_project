import 'package:clean_a/finance/domain/entities/expense.dart';
import 'package:clean_a/report/data/repositry/repository/report_repo.dart';
import 'package:flutter/foundation.dart';
import '../../finance/domain/entities/income.dart';

class ReportProvider extends ChangeNotifier {
  List<Expense>? _expense;
  List<Income>? _income;

  List<Expense>? get expense => _expense;
  List<Income>? get income => _income;
  ReportRepo reportService = ReportRepo();

  Future<void> generateSalesReport(DateTime startingDate, DateTime endDate) async {
    _income = await reportService.generateSalesReport(startingDate, endDate);
    notifyListeners();
  }

  Future<void> generatePurchaseReport(DateTime startTime, DateTime endTime) async {
    _expense = await reportService.generatePurchaseReport(startTime, endTime);
    notifyListeners();
  }
}
