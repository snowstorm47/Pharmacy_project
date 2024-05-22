import 'package:app/employee/domain/entities/employee.dart';
import 'package:app/shared/models/puser.dart';
import 'package:app/shared/services/UserRegistration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EmployeeRepo{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseAuth firebaseAuth= FirebaseAuth.instance; 
  Future<List<Object?>> listEmployees()async{
    final CollectionReference employeeCollection= firestore.collection('Employees');
    final snapshot = await employeeCollection.get();
   return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<Employee> getEmployee(String uid) async {
    final docRef = firestore.collection('Employees').doc(uid);
    final snapshot = await docRef.get();
    if (!snapshot.exists) {
      throw Exception('Employee with ID $uid not found');
    }
    final data = snapshot.data() as Map<String, dynamic>;
    return Employee.fromMap(data); // Convert from Map to Employee object
  }

   Future<void> saveEmployee({  required Status,
  required DoB,
  required Gender,
  required Address,
  required Phone,
  required Salary,
  required CvURL,
    required String email,
    required String branch,
    required String FirstName,
    required String LastName,
    required List<String> Permission,
    required List<String>access,
    required String password,
    required String role
  }) async {
      PUser? User;
    RegisterService registerService= RegisterService(FirebaseAuth.instance,FirebaseStorage.instance,FirebaseFirestore.instance);
   User= await registerService.registerUser(
                                 branch:branch,
                                  email: email,
                                  password: password,
                                  FirstName: FirstName,
                                  LastName: LastName,
                                  permission: Permission,
                                  access: access,
                                    role: role
                                    );
      if (User!=null){
      
      final  uid=User.uid;
      final photoUrl=  User.photoUrl;

    Employee employee = Employee(access: access, permission: Permission, FirstName: FirstName, LastName: LastName, photoUrl: photoUrl, role: role, uid: uid, branch: branch, email: email, Status: Status, DoB: DoB, Gender: Gender, Address: Address, Phone: Phone, Salary: Salary, CvURL: CvURL);
    final docRef = firestore.collection('employees').doc();
    await docRef.set(employee.toMap()); 
      }
      else{
        throw Exception('Error in Registering');
      }
  // Convert Employee object to Map
  }
  Future<List<Object?>> RemoveEmployee(String uid) async{
      final CollectionReference employeeCollection= firestore.collection('Employees');
    await employeeCollection.doc(uid).delete();
    return await listEmployees(); 
 
  }

  Future<String?> uploadCv(String cvPath) async {
    // Implement upload logic to Firebase Storage (refer to previous example)
  }
}

// Employee class with getters, setters, toMap(), and fromMap() methods
// (omitted for brevity)

