import 'package:app/shared/models/puser.dart';

class Attendance {

  final DateTime checkIn;
  final DateTime? checkOut; 
  final String status;
 Attendance ({

  required this.checkIn,
  required this.checkOut,
  required this.status
 });
 factory Attendance.fromMap(Map<String,dynamic> data)=> 
  Attendance(
   
    checkIn: data['checkIn'] as DateTime,
    checkOut: data['checkOut'] as DateTime,
    status: data['status'] as String,
    );
  
   Map<String,dynamic> toMap()=>{
   
    'checkIn':checkIn,
    'checkOut':checkOut,
     'status':status
  };
  


}