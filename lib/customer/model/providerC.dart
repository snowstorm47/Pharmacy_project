import 'package:clean_a/customer/data/user_data.dart';
import 'package:flutter/material.dart';
//import 'data_model.dart';

class UserProvider with ChangeNotifier {
  List<DataModel> _users = [];

  List<DataModel> get users => _users;

  void addUser(DataModel user) {
    _users.add(user);
    notifyListeners();
  }

  void updateUser(DataModel updatedUser) {
    print('Updating user: ${updatedUser.employeeId}');
    final index = _users.indexWhere((user) => user.employeeId == updatedUser.employeeId);
    if (index != -1) {
      _users[index] = updatedUser;
      print('User updated: ${_users[index].employeeName}');
      notifyListeners();
    } else {
      print('User not found');
    }
  }

  void deleteUser(DataModel user) {
    _users.removeWhere((u) => u.employeeId == user.employeeId);
    notifyListeners();
  }
}
