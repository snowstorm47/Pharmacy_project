
import 'package:clean_a/report/data/repositry/repository/report_repo.dart';
import 'package:flutter/foundation.dart';

class ReportProvider extends ChangeNotifier{

ReportRepo reportService = ReportRepo();

Future<void> generateSalesReport(DateTime startingDate,DateTime endtime)async{

await reportService.generateSalesReport(startingDate,endtime);

}
Future<void> generatePurchaseReport(DateTime startTime,DateTime endTime)async{
  await reportService.generatePurchaseReport(startTime,endTime);
}

}