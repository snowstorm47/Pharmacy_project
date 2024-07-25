import 'package:clean_a/shared/models/puser.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this import

// Extending the user model in order to access the data of the user
class Employee extends PUser {
  // Adding additional data to the employee
  String? Status;
  // Date of birth
  DateTime DoB;
  String location;
  String Gender;
  String Address;
  String Phone;
  int Salary;
  // If there is a CV being uploaded
  final String? CvURL;

  Employee({
    required this.location,
    required super.access,
    required super.permission,
    required super.FirstName,
    required super.LastName,
    required super.photoUrl,
    required super.role,
    required super.uid,
    required super.branch,
    required super.email,
    required this.Status,
    required this.DoB,
    required this.Gender,
    required this.Address,
    required this.Phone,
    required this.Salary,
    required this.CvURL
  });

  factory Employee.fromMap(Map<String, dynamic> data) {
    return Employee(
      location: data['location'] as String,
      uid: data['uid'] as String,
      email: data['email'] as String,
      FirstName: data['FirstName'] as String,
      LastName: data['LastName'] as String,
      role: data['role'] as String,
      branch: data['Branch'] as String?,
      photoUrl: data['photoUrl'] as String?,
      permission: List<String>.from(data['permission']),
      access: List<String>.from(data['access']),
      Status: data['Status'] as String?,
      Phone: data['Phone'] as String,
      DoB: (data['DoB'] as Timestamp).toDate(),
      Gender: data['Gender'] as String,
      Address: data['Address'] as String,
      Salary: data['Salary'] as int,
      CvURL: data['CvURL'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'FirstName': FirstName,
      'LastName': LastName,
      'role': role,
      if (branch != null) 'branch': branch,
      if (photoUrl != null) 'photoUrl': photoUrl,
      'permission': permission,
      'access': access,
      if (Status != null) 'Status': Status,
      'Phone': Phone,
      'DoB': Timestamp.fromDate(DoB),
      'Gender': Gender,
      'Address': Address,
      'Salary': Salary,
      'CvURL': CvURL,
      'location': location,
    };
  }
}
