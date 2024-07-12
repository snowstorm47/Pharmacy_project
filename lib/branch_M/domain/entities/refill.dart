class Refill{
  String branchName;
  String id;
  String refillRequest;
  String requestedBy;
  DateTime requestDate;
  Refill({
    required this.branchName,
    required this.refillRequest,
    required this.requestDate,
    required this.requestedBy,
    required this.id
  });

  factory Refill.fromMap(Map<String,dynamic> data)=> 
  Refill(
    branchName:data['branchName'] as String,
  refillRequest: data['refillRequest'] as String,
    requestedBy:data['requestedBy'] as String,
   requestDate:data['requestDate'] as DateTime,
   id:data['id'] as String,
    
  );
  Map<String,dynamic> toMap()=>{
      'branchName':branchName,
  'refillRequest': refillRequest,
    'requestdBy':requestedBy,
   'requestDate':requestDate,
   'id':id
  };

}