
import 'package:clean_a/settings/data/repositry/settings_repo.dart';
import 'package:flutter/foundation.dart';

import '../domain/entities/complaint.dart';
import '../domain/entities/role.dart';

class SettingProvider extends ChangeNotifier{

  List<Role>? _roles=[];
  List<Complaint>? _complaints=[];
  SettingRepo settingService = SettingRepo();
  List<Role>? get roles => _roles;
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
}