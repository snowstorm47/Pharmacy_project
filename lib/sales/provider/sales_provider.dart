
import 'package:clean_a/finance/domain/entities/cart.dart';

import 'package:clean_a/sales/data/respositories/sales_repo.dart';
import 'package:flutter/foundation.dart';

class SalesProvider extends ChangeNotifier{

SalesRepo salesService = SalesRepo();
Cart? _cart;
List<Item>? _item;

List<Item>? get item=>_item;
Cart? get cart =>_cart;

Future<void> addToCart(String medName,int quantity)async{
final cartItem = Item(medicineName: medName, quantity: quantity);
if(cartItem!= null){
  _item?.add(cartItem);
  if(_item!.isNotEmpty){
    final myitem= _item!;
  final mycart = Cart(items: myitem);
   _cart=mycart;
  notifyListeners();
  }
}
}

Future<void> sellProduct(String branchId)async{
 
 final mycart= _cart!;
 await salesService.sellProduct(mycart,branchId);
}

Future<void> sellCredit( Cart cart,String customerName,String companyName,String branchId)async{
  await salesService.sellCredit(cart, customerName, companyName, branchId);
}
Future<Map<String,dynamic>?> createPdfInvoice(String id)async{
  return await salesService.creatPdfInvoice(id);
}
Future<Map<String,dynamic>?> createPdfExpense(String id)async{
  return await salesService.createPdfExpense(id);
}
Future<void> downloadPdf(Map<String,dynamic>fileInfo)async{
  return await salesService.downloadPdf(fileInfo);
}
}