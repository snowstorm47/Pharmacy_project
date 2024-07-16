

import 'package:clean_a/customer/data/repositories/customer_repo.dart';
import 'package:flutter/foundation.dart';

import '../domain/entities/corp_employee.dart';
import '../domain/entities/customer.dart';

class CustomerProvider extends ChangeNotifier{

List<corporateCustomer>? _customer;
List<Corpemployee>? _employee;
CustomerRepo customerService = CustomerRepo();

List<corporateCustomer>? get customer =>_customer;
List<Corpemployee>? get employee =>_employee;



Future<void> addCustomer({
    required companyName,
    required companyContact,
    required companyEmail,
    required companyPhone,
    required companyAddress,
    required paymentTerms,
    required creditLimit,
    required medicalInsuranceProvider,
    required policyNumber,
    required emergencyContact,
    required details,
    required empData,
})async{
 try{
 await customerService.addCustomer(companyName: companyName, companyContact: companyContact, companyEmail: companyEmail, companyPhone: companyPhone, companyAddress: companyAddress, paymentTerms: paymentTerms, creditLimit: creditLimit, medicalInsuranceProvider: medicalInsuranceProvider, policyNumber: policyNumber, emergencyContact: emergencyContact, details: details, empData: empData);
 final customer = corporateCustomer(companyAddress: companyAddress, paymentTerms: paymentTerms, companyContact: companyContact, companyEmail: companyEmail, companyName: companyName, companyPhone: companyPhone, creditLimit: creditLimit, details: details, emergencyContact: emergencyContact, medicalInsuranceProvider: medicalInsuranceProvider, policyNumber: policyNumber);
 if(customer!=null){
  _customer?.add(customer);
  notifyListeners();
 }}catch(e){
  print(e.toString);
 }
}
Future<void> addCreditUser(
  {
        required employeeId,
        required firstName,
        required lastName,
        required  email,
        required company,
        required  address,
        required  city,
        required subCity,
        required  role,
        required  details
  }
)async{
  try{
 await customerService.addCorpCustomer(employeeId:employeeId,firstName:firstName, lastName: lastName, email: email, company: company, address: address, city: city, subCity: subCity, role: role, details: details);
 final emplyee = Corpemployee(employeeId: employeeId, firstName: firstName, lastName: lastName, email:email, credit: 0, company: company,  address:address, city: city, details: details, role: role, subCity: subCity);
 if(emplyee!=null){
  _employee?.add(emplyee);
  notifyListeners();
 }
}catch(e){
  print(e.toString);
}
}
Future<List<Corpemployee>?> findCustomer (String company,String searchString)async{

final creditUser=  customerService.findCustomer(company,searchString);
return  creditUser;
}

Future<List<Corpemployee>?> getAllcustomers()async{
  _employee=await customerService.getAllcustomers();
  notifyListeners();
}
Future<void> addCredit(String company,String id,double price)async{
 try{
await customerService.addCredit(company,id,price);
 }catch(e){
  print(e.toString());
 }
}


}

class employeeData extends ChangeNotifier{

List<List<dynamic>>? _employeeData;

List<List<dynamic>>? get emplData => _employeeData;
CustomerRepo customerService = CustomerRepo();
Future<void> getEmployee()async{
  _employeeData = await pickAndReadCsv();
  notifyListeners();
}

}