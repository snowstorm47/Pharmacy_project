
import 'package:clean_a/shared/models/puser.dart';
import 'package:clean_a/shared/services/authentication_service.dart';

import 'package:flutter/material.dart';

import '../../../settings/data/repositry/settings_repo.dart';



class Authprovider with ChangeNotifier{

   PUser? _user;
   String _error= '';
   
  PUser? get user => _user;
  SigninService signinService = SigninService();
  SettingRepo  settingService = SettingRepo();
  bool _isLoggedIn= false;
  bool get isLoggedIn => _isLoggedIn;
  String? get error => _error;

  Future<void> sign_in( String email,String password) async{
    try{
      _user = await  signinService.SigninUser(email: email,password:password);
      if(_user!=null){
        _isLoggedIn = true;
      notifyListeners();
      }
      else{
        _error = "Incorrect Email and Password";
        notifyListeners();
      }
       
    }
    catch(e){
      print(e.toString());
    }
  }
  Future<void> logOut()async{
    try{
      await signinService.Signout();
      _isLoggedIn=false;
      notifyListeners();
      }
    catch(e){
      print(e.toString());
    }
    }
  Future<void> sendPassword(String email) async{
    try{
      await settingService.addRequest(email:email);
      // await signinService.sendPasswordResetEmail(email: email);
      notifyListeners();
    }
    catch(e){
      print(e.toString());
    }
  }


  
  
}