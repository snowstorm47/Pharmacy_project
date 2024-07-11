class Refill{
  String branchName;
  String refillRequest;
  String requestedBy;
  DateTime requestDate;
  Refill({
    required this.branchName,
    required this.refillRequest,
    required this.requestDate,
    required this.requestedBy,
  });

  factory Refill.fromMap(Map<String,dynamic> data)=> 
  Refill(
    branchName:data['branchName'] as String,
  refillRequest: data['refillRequest'] as String,
    requestedBy:data['requestedBy'] as String,
   requestDate:data['requestDate'] as DateTime,
    
  );
  Map<String,dynamic> toMap()=>{
      'branchName':branchName,
  'refillRequest': refillRequest,
    'requestdBy':requestedBy,
   'requestDate':requestDate
  };

}