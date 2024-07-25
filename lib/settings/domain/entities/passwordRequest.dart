class PasswordRequest{
  String email;
  DateTime requestedAt;
  bool isUser;
  String role;
  PasswordRequest({
    required this.email,
    required this.requestedAt,
    required this.isUser,
    required this.role
  });
  factory PasswordRequest.fromMap(Map<String,dynamic> data) =>
  PasswordRequest(
    email: data['email'] as String,
    isUser: data['isUser'] as bool,
    requestedAt : data['requestedAt'] as DateTime,
    role:data['role'] as String
  );
   Map<String,dynamic> toMap()=>{
  'email':email,
  'isUser':isUser,
 'requestedAt':requestedAt,
 'role':role
  
  };
}