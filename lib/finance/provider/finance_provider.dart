
import 'package:clean_a/finance/data/repositry/finance_repo.dart';
import 'package:clean_a/finance/domain/entities/invoice.dart';
import 'package:flutter/foundation.dart';

import '../domain/entities/expense.dart';
import '../domain/entities/income.dart';

class FinanceProvider extends ChangeNotifier{

// List<Invoice> _invoice;
List<Expense>? _expense;
List<Invoice>? _income;

List<Expense>? get expense => _expense;
List<Invoice>? get income => _income;

FinanceRepo financeService = FinanceRepo();

Future<void> addInvoice(branchId,
   amount,
  catagory,
  customerName,
  incomeHead,
  items,
  price)async{
    try{
    final incom = await financeService.addInvoice(amount: amount,catagory: catagory,customerName: customerName,incomeHead: incomeHead,items:items,price: price );
    if(incom!= null){
      _income?.add(incom);
      notifyListeners();
    }
    }catch(e){
      print(e.toString());
  }
  }

  Future<void> addExpense(  branchId,
   amount,
  catagory,
  expenseHead,
  createdAt)async{
final exp = await financeService.addExpense(branchId: branchId,amount: amount,catagory: catagory,expenseHead: expenseHead,createdAt: createdAt);
if(exp!= null){
  _expense?.add(exp);
  notifyListeners();
}
  }
Future<Invoice?> getIncome(String invoiceId)async{
return  await financeService.getIncome(invoiceId);
}
Future<void> getlistIncome()async{
try{
  _income= await financeService.getlistIncome();
  notifyListeners();

}catch(e){
  print(e.toString());
}

}
Future<void> getlistExpense()async{
  try{
    _expense = await financeService.getlistExpense(); 
    notifyListeners();
  }catch(e){
  print(e.toString());
  }
}

Future<Expense?> getExpense(String invoiceId)async{

 return await financeService.getExpense(invoiceId);  
}

Future<double?> getMonthExpense()async{
  return await financeService.getMonthExpense();
}
Future<double?> getMonthIncome() async{
  return await financeService.getMonthIncome();
}

}