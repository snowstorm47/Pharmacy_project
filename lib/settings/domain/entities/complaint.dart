class Complaint {
  String employeeName;
  String catagory;
  DateTime complaintTime;
  Status status;
  String description;
  Complaint({
  required this.catagory,
  required this.employeeName,
  required this.complaintTime,
  required this.status,
  required this.description
  });
    factory Complaint.fromMap(Map<String,dynamic> data) =>
  Complaint(
    employeeName: data['employeeName'] as String,
    catagory: data['catagory'] as String,
    complaintTime: data['complaintTime'] as DateTime,
    status:data['status'] as Status,
    description: data['description'] as String
  );
   Map<String,dynamic> toMap()=>{
  'catagory':catagory,
  'description':description,
 'status':status,
  'employeeName':employeeName,
  'complaintTime':complaintTime
  };
}

enum Status {
  Solved,
  New,
  Cancelled
}