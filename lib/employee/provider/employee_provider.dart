
import 'package:clean_a/employee/domain/entities/attendance.dart';
import 'package:flutter/foundation.dart';

import '../../shared/models/puser.dart';
import '../data/repositry/employee_repo.dart';
import '../domain/entities/employee.dart';

class EmployeeProvider extends ChangeNotifier{
 EmployeeRepo employeeService = EmployeeRepo();

 List<Employee>? _employee=[];
 List<Attendance>? _attendance=[];

List<Employee>? get employee => _employee;
List<Attendance>? get attendance => _attendance;

Future<void> addEmployee(  {required Status,
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
  Gender: Gender,
  Address:  Address,
  Phone:  Phone,
  Salary:  Salary,
  user:   user,
  file:  file,
 );
 if(emply!=null){
  _employee!.add(emply);
 notifyListeners();}
}

Future<void> removeEmployee(String uid) async{
 await employeeService.RemoveEmployee(uid);
 _employee!.removeWhere((element) => element.uid == uid);
 notifyListeners();
}

Future<void> editEmployee (String uid, {required Map<String,dynamic> updatedData})async{
  await employeeService.editEmployee(uid, updatedData: updatedData);
 final index = _employee?.indexWhere((empl) => empl.uid==uid);
   if(index!=null){
    if (index != -1) {
      _employee![index] = Employee.fromMap({..._employee![index].toMap(), ...updatedData});
      notifyListeners();
    }
   }
}

Future<void> addAttendance(String uid,DateTime start,DateTime end,String Status)async{
 await employeeService.addAttendance(uid,checkIn: start, checkOut: end, status: Status);
 final attndance = Attendance(checkIn: start,checkOut: end,status: Status);
 _attendance!.add(attndance);
 notifyListeners();
}
Future<void> getAttendance(String uid) async{
_attendance=await employeeService.getAttendance(uid);
notifyListeners();
}

}