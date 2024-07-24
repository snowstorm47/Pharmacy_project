class PasswordRequest{
  String email;
  DateTime requestedAt;
  bool isUser;
  PasswordRequest({
    required this.email,
    required this.requestedAt,
    required this.isUser,
  });
  factory PasswordRequest.fromMap(Map<String,dynamic> data) =>
  PasswordRequest(
    email: data['email'] as String,
    isUser: data['isUser'] as bool,
    requestedAt : data['requestedAt'] as DateTime
  );
   Map<String,dynamic> toMap()=>{
  'email':email,
  'isUser':isUser,
 'requestedAt':requestedAt,
  
  };
}