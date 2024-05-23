import 'dart:ffi';

import 'package:app/shared/models/puser.dart';
// extending the user model inorder to access the data of the user
class Employee extends PUser{
  //adding additional data to the employee
  String Status;
  //date  of birth
   DateTime DoB;
   Char Gender;
   String Address;
   String Phone;
   int Salary;
   //if there is a cv being uploaded
   final String? CvURL;

  Employee({
    required super.access,
     required super.permission,
      required super.FirstName,
       required super.LastName,
        required super.photoUrl,
         required super.role,
          required super.uid,
           required super.branch,
            required super.email,
            required  this.Status, 
            required this.DoB,
            required this.Gender,
            required this.Address,
            required this.Phone,
            required this.Salary,
            required this.CvURL
            });
  factory Employee.fromMap(Map<String,dynamic> data)=> 
  Employee(
    uid:data['uid'] as String,
    email:data['email']as String,
    FirstName:data['FirstName'] as String,
    LastName: data['LastName'] as String,
    role:data['role'] as String,
    branch:data['Branch']as String?,
    photoUrl:data['photoUrl']as String?,
    permission:data['Permission'] as List<String>,
    access:data['Access'] as List<String>,
    Status: data['Status'] as String,
    Phone: data['Phone'] as String,
    DoB: data['DoB'] as DateTime,
    Gender:data['Gender'] as Char,
    Address: data['Address'] as String,
    Salary: data['Salary'] as int,
    CvURL: data['CvURL'] as String,
  );
  
   Map<String,dynamic> toMap()=>{
   'uid':uid,
   'email':email,
   'FirstName':FirstName,
   'LastName':LastName,
   'role':role,
   if(branch !=null)  'branch':branch,
   if(photoUrl!=null) 'photoUrl':photoUrl,
   'permission':permission,
   'Access':access,
   'Status':Status,
    'Phone': Phone,
    'DoB': DoB,
    'Gender':Gender,
    'Address': Address,
    'Salary': Salary,
    'CvURL': CvURL,
  };
}