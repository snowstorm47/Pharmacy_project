class Branch{
  final String BranchName;
  final String Branch_id;
  final String Address;
  final String BranchEmail;
  final String phoneNo;
  final int totalEmployees;
  final int storeCapacity;
  final String BranchManager;
  final String Description;
  final String openHours;
  Branch({
    required this.Address,
    required this.BranchEmail,
    required this.BranchManager,
    required this.BranchName,
    required this.Branch_id,
    required this.Description,
    required this.openHours,
    required this.phoneNo,
    required this.storeCapacity,
    required this.totalEmployees,

  });
   factory Branch.fromMap(Map<String,dynamic> data)=> 
  Branch(
    BranchName:data['BranchName'] as String,
  Branch_id: data['Branch_id'] as String,
    Address:data['Address'] as String,
   BranchEmail:data['BranchEmail'] as String,
    phoneNo: data['phoneNo'] as String, 
   totalEmployees:data['totalEmployees'] as int,
 storeCapacity:data['storeCapacity'] as int,
  BranchManager:data['BranchManager'] as String,
   Description:data["Description"] as String,
  openHours:data['openHours'] as String,
  );
  Map<String,dynamic> toMap()=>{
      'BranchName':BranchName,
  'Branch_id': Branch_id,
    'Address':Address,
   'BranchEmail':BranchEmail,
    'phoneNo': phoneNo, 
   'totalEmployees':totalEmployees ,
 'storeCapacity':storeCapacity,
  'BranchManager':BranchManager,
   'Description':Description,
  'openHours':openHours,
  };


}