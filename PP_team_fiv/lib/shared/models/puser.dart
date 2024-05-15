class PUser{
  final String name;
  final String email;
  final String? branch;
  final String uid;
  final String? photoUrl;
  final String role;
  final List<String> permission;
  final List<String> access;
 PUser({
    required this.access,
    required this.permission,
    required this.name,
    required this.photoUrl,
    required this.role,
    required this.uid,
    required this.branch,
    required this.email
  });

  factory PUser.fromMap(Map<String,dynamic> data)=> 
  PUser(
    uid:data['uid'] as String,
    email:data['email']as String,
    name:data['Name'] as String,
    role:data['role'] as String,
    branch:data['Branch']as String?,
    photoUrl:data['photoUrl']as String?,
    permission:data['Permission'] as List<String>,
    access:data['Access'] as List<String>,
  );
  Map<String,dynamic> toMap()=>{
   'uid':uid,
   'email':email,
   'name':name,
   'role':role,
   if(branch !=null)  'branch':branch,
   if(photoUrl!=null) 'photoUrl':photoUrl,
   'permission':permission,
   'Access':access,
  };
  }