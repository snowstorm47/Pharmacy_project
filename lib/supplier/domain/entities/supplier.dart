
class Supplier{
  String name;
  String email;
  String subCity;
  String address;
  String supplies;
  String status;
  String city;
  String paymentTerm;
  String description;
  String phoneNumber;
  String supplierId;
  Supplier({
    required this.name,
    required this.city,
    required this.address,
    required this.description,
    required this.email,
    required this.paymentTerm,
    required this.phoneNumber,
    required this.status,
    required this.subCity,
    required this.supplies,
    required this.supplierId
  });

  factory Supplier.fromMap(Map<String,dynamic> data)=>
  Supplier(
    supplierId: data['supplierId'] as String,
    name: data["name"] as String,
    city: data['city'] as String,
     email: data['email'] as String,
      address: data['address'] as String, 
      paymentTerm:data['paymentTerm'] as String,
       phoneNumber: data['phoneNumber'] as String,
        description: data['description'] as String,
        subCity:data['subCity'] as String, 
        status: data['status'] as String,
        supplies: data['supplies'] as String,
       );

  Map<String,dynamic> toMap()=>{
    'supplierId':supplierId,
  'name':name,
   'email':email,
  'subCity' :subCity,
  'address' :address,
  'supplies':supplies,
  'status' :status,
  'city':city,
  'paymentTerm':paymentTerm,
   'description':description,
  'phoneNumber':phoneNumber,
  };
}