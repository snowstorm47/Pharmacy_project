


import 'dart:io';
import 'dart:typed_data';

import 'package:app/employee/domain/entities/employee.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../shared/models/puser.dart';
import '../../domain/entities/attendance.dart';

//picks CV files from the user device
Future<Uint8List?> pickFile() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'pdf', 'doc'],
  );
  if (result != null) {
    final platformFile = result.files.single.bytes;
    try {
      if(platformFile!=null){
      return Uint8List.fromList(platformFile);
      }
    } catch (e) {
      print('Error reading file bytes: $e');
      return null; // Or provide a user-friendly error message
    }
  } else {
    print('No file selected');
    return null;
  }
}

    
  
//class responsible for changes in Employee entity
class EmployeeRepo{

  final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  EmployeeRepo(this._firebaseStorage,this._firebaseFirestore,this._firebaseAuth);
 

  Future<List<Map<dynamic,dynamic>>> listEmployees()async{
    final CollectionReference employeeCollection= _firebaseFirestore.collection('Employees');
    final snapshot = await employeeCollection.get();
   return snapshot.docs.map((doc) => doc.data() as Map<dynamic, dynamic>).toList();
  }
  Future<Employee> getEmployee(String uid) async {
    final docRef = _firebaseFirestore.collection('Employees').doc(uid);
    final snapshot = await docRef.get();
    if (!snapshot.exists) {
      throw Exception('Employee with ID $uid not found');
    }
    final data = snapshot.data() as Map<String, dynamic>;
    return Employee.fromMap(data); // Convert from Map to Employee object
  }

  Future<Employee?> saveEmployee({  
  required Status,
  required DoB,
  required Gender,
  required Address,
  required Phone,
  required Salary,
  required PUser user,
  required Uint8List? file,
  }) async {
  final  User = user; 
      if (User!=null){
     
      final  uid=User.uid;
      final photoUrl=  User.photoUrl;
       final Cvurl = await uploadCv(uid,file);
    Employee employee = Employee(
              access: User.access,
              permission: User.permission,
              FirstName:User.FirstName,
              LastName: User.LastName,
              photoUrl: photoUrl,
              role:User.role, 
              uid: uid, 
              branch:User.branch,
              email:User.email, 
              Status: Status, 
              DoB: DoB, 
              Gender: Gender, 
              Address: Address,
              Phone: Phone,
                Salary: Salary, 
                CvURL: Cvurl,
                ); 
     await _firebaseFirestore.collection('employees').doc(uid).set(employee.toMap());
    return employee;
      }
      else{
        throw Exception('Error in Registering');
      }
  // Convert Employee object to Map
  }
  Future<List<Map<dynamic,dynamic>>> RemoveEmployee(String uid) async{
      final CollectionReference employeeCollection= _firebaseFirestore.collection('Employees');
    await employeeCollection.doc(uid).delete();
    return await listEmployees(); 
 
  }

//uploads the cv
Future<String?> uploadCv(String uid,Uint8List? file) async {
  
  if (file!= null) {
    // upload the file as Uint8List
    final reference = _firebaseStorage.ref().child('cv/$uid');
    final task = reference.putData(file);
    final snapshot = await task.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return url;
  } else {
    throw Exception("Error occurred, couldn't access the file path");
  }
}
Future<void> editEmployee(String uid, {required Map<String, dynamic> updatedData}) async {
  final collectionReference = _firebaseFirestore.collection('employees');
  final document = collectionReference.doc(uid);

  // Transaction for data consistency
  await _firebaseFirestore.runTransaction((transaction) async {
    final documentSnapshot = await transaction.get(document);

    if (!documentSnapshot.exists) {
      throw Exception('Employee with ID: $uid not found'); // Handle non-existent employee
    }

    // Update only specified fields (prevents overwriting entire document)
    final existingData = documentSnapshot.data()!;
    existingData.updateAll((key, value) => updatedData.containsKey(key) ? updatedData[key] : value);

    transaction.set(document, existingData);
  });
}
Future<void> addAttendance(String uid, {required DateTime checkIn, required DateTime checkOut, required String status}) async {
  final collectionReference = _firebaseFirestore.collection('Attendance');
  final attendance = Attendance(checkIn: checkIn, checkOut: checkOut, status: status);

  // Transaction to ensure data consistency
  await _firebaseFirestore.runTransaction((transaction) async {
    final documentSnapshot = await transaction.get(collectionReference.doc(uid));

    List<Map<String, dynamic>> existingAttendance = [];
    if (documentSnapshot.exists) {
      existingAttendance = documentSnapshot.data()!['attendance'] as List<Map<String, dynamic>>;
    }

    existingAttendance.add(attendance.toMap());  // Add new attendance to the list

    transaction.set(collectionReference.doc(uid), {
      'attendance': existingAttendance,
    });
  });
}
Future<List<Attendance>> getAttendance(String uid) async {
  final collectionReference = _firebaseFirestore.collection('Attendance');
  final documentSnapshot = await collectionReference.doc(uid).get();

  if (!documentSnapshot.exists) {
    return []; // No document found, returns empty list
  }

  final List<Map<String, dynamic>> attendanceData = documentSnapshot.data()!['attendance'] as List<Map<String, dynamic>>;

  final List<Attendance> attendances = attendanceData.map((data) => Attendance.fromMap(data)).toList();
  return attendances;
}


}
