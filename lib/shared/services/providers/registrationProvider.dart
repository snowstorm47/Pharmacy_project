

import 'dart:typed_data';
import 'package:clean_a/shared/models/puser.dart';
import 'package:clean_a/shared/services/UserRegistration.dart';
import 'package:flutter/material.dart';

class registrationProvider with ChangeNotifier{
 PUser? _user;
 bool _isRegistering =false;
  String _errorMessage = '';

  bool get isRegistering => _isRegistering;
  String get errorMessage => _errorMessage;
 PUser? get user => _user;
 RegisterService registerService = RegisterService();

Future<void> registerUser({ 
  required String branch,
   required String role,
    required String email,
     required String password,
      required String FirstName,
       required String LastName,
       required List<String> permission, 
       required List<String> access,
        Uint8List? bytes
})  
 async{
    _isRegistering = true;
    _errorMessage = '';
    notifyListeners(); 
 try{
  _user =await registerService.registerUser(branch: branch, role: role, email: email, password: password, FirstName: FirstName, LastName: LastName, permission: permission, access: access,bytes:bytes);

 }catch(e){
  _errorMessage = e.toString();
 }finally{
     _isRegistering = false;
      notifyListeners(); 
 }
}
}

class imageProvider with ChangeNotifier{
 Uint8List? _image;
 bool _success = false;
 Uint8List? get image => _image;
 RegisterService registerService = RegisterService();
 bool get success =>_success;

 Future<void> getImage ()async{
  try{
    _image = await pickImage();
    if(_image!=null){
     _success= true;
    notifyListeners();
    }
 
  }catch(e){
    print(e.toString());
    _success = false;
    notifyListeners();
  }
 }
  
}

