
class Role{
  String name;
  String employeeName;
  String description;
  List<String> access;
  List<String> actions;
  Role({
  required this.description,
  required this.employeeName,
  required this.access,
  required this.actions,
  required this.name,
  });
  factory Role.fromMap(Map<String,dynamic> data) =>
  Role(
    description: data['description'] as String,
    employeeName:data['employeeName'] as String,
    access: data['access'] as List<String>,
    actions: data['actions'] as List<String>,
    name:data['name'] as String
  );
   Map<String,dynamic> toMap()=>{
  'name':name,
  'description':description,
 'access':access,
  'actions':actions,
  };
  }