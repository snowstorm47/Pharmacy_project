class PUser{
   String FirstName;
  String LastName;
   String email;
   String? branch;
   String uid;
   String? photoUrl;
   String? role;
   List<String> permission;
   List<String> access;
 PUser({
    required this.access,
    required this.permission,
    required this.FirstName,
    required this.LastName,
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
    FirstName:data['FirstName'] as String,
    LastName: data['LastName'] as String,
    role:data['role'] as String,
    branch:data['Branch']as String?,
    photoUrl:data['photoUrl']as String?,
    permission:data['Permission'] as List<String>,
    access:data['Access'] as List<String>,
  );
  Map<String,dynamic> toMap()=>{
   'uid':uid,
   'email':email,
   'FirstName':FirstName,
   'LastName':LastName,
   'role':role ?? 'Default',
   if(branch !=null)  'branch':branch,
   if(photoUrl!=null) 'photoUrl':photoUrl,
   'permission':permission,
   'Access':access,
  };
  }