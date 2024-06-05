
class corporateCustomer{
  String companyName;
  String companyContact;
  String companyEmail;
  String companyPhone;
  String companyAddress;
  String paymentTerms;
  double creditLimit;
  String medicalInsuranceProvider;
  String policyNumber;
  String emergencyContact;
  String details;
 
 corporateCustomer({
  required this.companyAddress,
  required this.paymentTerms,
  required this.companyContact,
  required this.companyEmail,
  required this.companyName,
  required this.companyPhone,
  required this.creditLimit,
  required this.details,
  required this.emergencyContact,

  required this.medicalInsuranceProvider,
  required this.policyNumber
 });
 factory corporateCustomer.fromMap(Map<String,dynamic>data)=>
 corporateCustomer(
  companyAddress:data['companyAddress'] as String,
  paymentTerms:data['paymentTerms'] as String ,
  companyContact: data['companyContact'] as String,
  companyEmail: data['companyEmail'] as String,
  companyName: data['companyName'] as String,
  companyPhone:data['companyPhone'] as String,
  creditLimit:data['creditLimit'] as double,
  details: data['details'] as String,
  emergencyContact:data['emergencyContact'] as String,
  medicalInsuranceProvider: data['medicalInsuranceProvider'] as String,
  policyNumber: data['policyNumber'] as String
   );
   Map<String, dynamic> toMap()=>{
    'companyName':  companyName,
   'companyContact':companyContact,
    'companyEmail':companyEmail,
   'companyPhone':companyPhone,
   'companyAddress':companyAddress,
   'paymentTerms':paymentTerms,
  'creditLimit':creditLimit,
  'medicalInsuranceProvider':medicalInsuranceProvider,
   'policyNumber':policyNumber,
   'emergencyContact':emergencyContact,
   'details':details,
   };
}