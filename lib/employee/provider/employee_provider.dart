
import 'package:clean_a/employee/domain/entities/attendance.dart';
import 'package:flutter/foundation.dart';

import '../../shared/models/puser.dart';
import '../data/repositry/employee_repo.dart';
import '../domain/entities/employee.dart';

class EmployeeProvider extends ChangeNotifier{
 EmployeeRepo employeeService = EmployeeRepo();

String? _status='';
 List<Employee>? _employee=[];
 List<Attendance>? _attendance=[];

List<Employee>? get employee => _employee;
String? get status=> _status;
List<Attendance>? get attendance => _attendance;

Future<void> addEmployee(  {required Status,
  required location,
  required DoB,
  required Gender,
  required Address,
  required Phone,
  required Salary,
  required PUser user,
  required Uint8List? file}) async{
 final emply = await employeeService.saveEmployee(
    Status:  Status,
  DoB:  DoB,
  location:location,
  Gender: Gender,
  Address:  Address,
  Phone:  Phone,
  Salary:  Salary,
  user:   user,
  file:  file, 
 );
 if(emply!=null){
  _employee?.add(emply);
 notifyListeners();}
}

Future<void> removeEmployee(String uid) async{
 await employeeService.RemoveEmployee(uid);
 _employee!.removeWhere((element) => element.uid == uid);
 notifyListeners();
}

Future<void> editEmployee (String uid, {required Map<String,dynamic> updatedData})async{
  await employeeService.editEmployee(uid, updatedData: updatedData);
 final index = _employee!.indexWhere((empl) => empl.uid==uid);
   if(index!=null){
    if (index != -1) {
      _employee![index] = Employee.fromMap({..._employee![index].toMap(), ...updatedData});
      notifyListeners();
    }
   }
}
Future<void> getEmployees() async {
  try {
    final employees = await employeeService.listEmployees();
    _employee = employees; 
    print(employees);// Assign an empty list if `employees` is null
    notifyListeners();
  } catch (e) {
    print('Error fetching employees: $e');
    // Optionally, handle the error or notify the user
  }
}
Future<void> addAttendance(String uid,String start,String end,String Status,String name,DateTime date)async{
 await employeeService.addAttendance(date: date,  uid, signInTime: start, signOutTime: end, name: name);
 final attndance = Attendance(id: uid, date: date, name: name, signInTime: start, signOutTime: end);
 _attendance!.add(attndance);
 _status=Status;
 notifyListeners();
}
Future<void> getAttendance(String uid) async{
_attendance=await employeeService.getAttendance(uid);
notifyListeners();
}

}

class cvProvider with ChangeNotifier{
 Uint8List? _file;
 bool _success = false;
 Uint8List? get file => _file;
 EmployeeRepo registerService = EmployeeRepo();
 bool get success =>_success;

 Future<void> getFile ()async{
  try{
    _file= await pickFile();
    if(_file!=null){
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