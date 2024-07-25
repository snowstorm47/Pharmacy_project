
import 'package:cloud_firestore/cloud_firestore.dart';

class Attendance {
  final String id; // Unique identifier for the attendance record
  final DateTime date; // Date of the attendance
  final String name; // Name of the employee or person
  final String signInTime; // Sign-in time in HH:MM format
  final String signOutTime; // Sign-out time in HH:MM format

  Attendance({
    required this.id,
    required this.date,
    required this.name,
    required this.signInTime,
    required this.signOutTime,
  });

  // Converts a Firestore document to an Attendance instance
  factory Attendance.fromMap(Map<String, dynamic> data) {
    return Attendance(
      id: data['id'] as String,
      date: (data['date'] as Timestamp).toDate(),
      name: data['name'] as String,
      signInTime: data['signInTime'] as String,
      signOutTime: data['signOutTime'] as String,
    );
  }

  // Converts an Attendance instance to a Firestore document format
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': Timestamp.fromDate(date),
      'name': name,
      'signInTime': signInTime,
      'signOutTime': signOutTime,
    };
  }
}
