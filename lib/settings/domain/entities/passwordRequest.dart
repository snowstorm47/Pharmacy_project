import 'package:cloud_firestore/cloud_firestore.dart';

class PasswordRequest {
  String email;
  DateTime requestedAt;
  bool isUser;
  String role;

  PasswordRequest({
    required this.email,
    required this.requestedAt,
    required this.isUser,
    required this.role,
  });

  factory PasswordRequest.fromMap(Map<String, dynamic> data) {
    return PasswordRequest(
      email: data['email'] as String,
      isUser: data['isUser'] as bool,
      requestedAt: data['requestedAt'] is Timestamp
          ? (data['requestedAt'] as Timestamp).toDate()
          : data['requestedAt'] as DateTime,
      role: data['role'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'isUser': isUser,
      'requestedAt': Timestamp.fromDate(requestedAt),
      'role': role,
    };
  }
}
