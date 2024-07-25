
import 'package:clean_a/settings/data/repositry/settings_repo.dart';
import 'package:clean_a/settings/domain/entities/passwordRequest.dart';
import 'package:clean_a/shared/models/puser.dart';
import 'package:flutter/foundation.dart';

import '../domain/entities/complaint.dart';
import '../domain/entities/role.dart';

class SettingProvider extends ChangeNotifier{

  List<Role>? _roles=[];
  List<PUser>? requests=[];
  List<PasswordRequest>? _passreq = [];
  List<Complaint>? _complaints=[];
  SettingRepo settingService = SettingRepo();
  List<Role>? get roles => _roles;
  List<PasswordRequest>? get passreq => _passreq;
  List<Complaint>? get complaints => _complaints;
  Future<void> addRole({
      required String name,
  required List<String> actions,
  required List<String> access,
  required String employeeName,
  String? description}
  )async{
final role=await settingService.addRole(access: access, employeeName: employeeName, name: name, actions: actions,description:description);
if(role!=null){
_roles!.add(role);
notifyListeners();
}
 }
 Future<void> editRole(String employeeName,{required Map<String,dynamic> updatedData})async{
   try{
    await settingService.editRole(employeeName, updatedData: updatedData);
    final index = _roles?.indexWhere((item)=>item.employeeName == employeeName);
    if(index!=null){
      _roles![index]=Role.fromMap({..._roles![index].toMap(), ...updatedData});
      notifyListeners();
    }
    }
    catch(e){
      print(e.toString());
    }
 }

 Future<void> getPassReq()async{
 _passreq = await settingService.getRequest();
 notifyListeners();
 }
 Future<void> sendPass(String id)async{
   try{
    await settingService.grantNewPass(id);
    final index = _passreq?.indexWhere((item)=>item.email == id);
    if(index!=null){
      _passreq!.removeAt(index);
      notifyListeners();
    }
   }catch(e){
    print(e.toString());
   }
 }

  Future<void> delPass(String id)async{
   try{
    await settingService.deleteRequest(id);
    final index = _passreq?.indexWhere((item)=>item.email == id);
    if(index!=null){
      _passreq!.removeAt(index);
      notifyListeners();
    }
   }catch(e){
    print(e.toString());
   }
 }
 

}