
import 'package:clean_a/return/data/repositry/return_repo.dart';
import 'package:flutter/foundation.dart';

import '../domain/entities/disposed.dart';

class ReturnProvider extends ChangeNotifier{

  List<Disposed>? _disposedList;
  DisposedRepo disposedService= DisposedRepo();

  List<Disposed>? get disposedList=>_disposedList;

  Future<void> addDisposed({required String batchId,required String medicineName,required String reason})async{
 final item=await disposedService.addDisposed(batchId: batchId, medicineName: medicineName, reason: reason);
  if(item!=null){
    _disposedList?.add(item);
    notifyListeners();
  } 
  }
  Future<void> removeDisposed(String batchId) async{
    await disposedService.removeDisposed(batchId);
     _disposedList!.removeWhere((item) => item.batchId == batchId);
    notifyListeners();
  }
  Future<void> deleteMultiple(List<String> id) async{
    await disposedService.deleteManyDisposed(id);
    for(final batchId in id ){
       _disposedList?.removeWhere((item) => item.batchId == batchId);
       notifyListeners();
    }
  }
  Future<void> getDisposed()async{
  _disposedList = await disposedService.getDisposed();
  notifyListeners();
  }
}