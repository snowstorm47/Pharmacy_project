class Corpemployee{
  String employeeId;
  String firstName;
  String lastName;
  String email;
  String company;
  String address;
  String city;
  String subCity;
  String role;
  String details;
  double credit; 
  Corpemployee({
    required this.credit,
    required this.company,
    required this.email,
    required this.employeeId,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.city,
    required this.details,
    required this.role,
    required this.subCity
  });
  factory Corpemployee.fromMap(Map<String,dynamic> data)=>
  Corpemployee(
    credit: data['credit'] as double,
    company: data['company'] as String  ,
     email: data['email'] as String,
      employeeId: data['employeeId'] as String, 
      firstName:data['firstName'] as String,
       lastName: data['lastName'] as String,
        address: data['address'] as String,
        city:data['city'] as String,
        details: data['details'] as String,
        subCity:data['subCity'] as String, 
        role: data['role'] as String,

       );

  Map<String,dynamic> toMap()=>{
   'credit':credit,
   'company':company,
   'email':email,
   'firstName':firstName,
   'lastName':lastName,
   'employeeId':employeeId,
   'role':role,
   'address':address,
   'city':city,
   'subCity':subCity,
   'details':details,
  };
}
