

import 'package:clean_a/customer/data/repositories/customer_repo.dart';
import 'package:flutter/foundation.dart';

import '../domain/entities/corp_employee.dart';
import '../domain/entities/customer.dart';

class CustomerProvider extends ChangeNotifier{

List<corporateCustomer> _customer=[];
List<Corpemployee> _companyEmployee=[];

List<Corpemployee>? _employee;
CustomerRepo customerService = CustomerRepo();

List<corporateCustomer>? get customer =>_customer;
List<Corpemployee>? get employee =>_employee;
List<Corpemployee>? get companyEmployee => _companyEmployee;

List<corporateCustomer> _filteredCompanies = [];
  List<Corpemployee> _filteredCustomers = [];
  corporateCustomer? _selectedCompany;

  corporateCustomer? get selectedCompany => _selectedCompany;

 
  List<corporateCustomer> get filteredCompanies => _filteredCompanies;
  List<Corpemployee> get filteredCustomers => _filteredCustomers;

  void filter(String query) {
    if (query.isEmpty) {
      _filteredCompanies = _customer;
      _filteredCustomers = _companyEmployee;
    } else {
      _filteredCompanies = _customer
          .where((company) =>
              company.companyName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    _filteredCustomers = _employee!
          .where((customer) =>
              customer.firstName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void selectCompany(corporateCustomer company) {
    _selectedCompany = company;
    // Filter customers based on selected company if necessary
    notifyListeners();
  }

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
        required  details,
        required phone
  }
)async{
  try{
 await customerService.addCorpCustomer(employeeId:employeeId,firstName:firstName, lastName: lastName, email: email, company: company, address: address, city: city, subCity: subCity, role: role, details: details,phone:phone);
 final emplyee = Corpemployee(employeeId: employeeId, firstName: firstName, lastName: lastName, email:email, credit: 0, company: company,  address:address, city: city, details: details, role: role, subCity: subCity,phone:phone);
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

Future<void> getAllcustomers()async{
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

Future<void> listCustomer()async{
 try{
_customer= (await customerService.listCustomer())!;
notifyListeners();
 }catch(e){
  print(e.toString());
 }
}

Future<void> creditUsers(String company) async{
  try{
    _companyEmployee= (await customerService.getEmployees(company))!;
  }catch(e){
    print(e.toString());
  }
}

Future<void> deleteCustomer(String company, String employeeId)async{
  try{
    await customerService.deleteCorpEmployee(employeeId:employeeId,company:company);
         _employee!.removeWhere((emp) => emp.employeeId == employeeId && emp.company ==company);
         notifyListeners();
    }catch(e){
    print(e.toString());
  }
}
Future<void> editCustomer(String company, String employeeId, {required Map<String, dynamic> updatedData}) async {
  try {
  
    await customerService.editCorpEmployee(company:company,employeeId: employeeId, updatedData: updatedData);

    if (_employee != null && _employee!.isNotEmpty) {
      final index = _employee!.indexWhere((emp) => emp.employeeId == employeeId && emp.company == company);
      if (index != -1) {
        _employee![index] = Corpemployee.fromMap({..._employee![index].toMap(), ...updatedData});
        notifyListeners();
      }
    } else {
      // Handle the case where _employee is null or empty
      print('Employee list is empty or null');
    }
  } catch (e) {
    // Print the error to the console or handle it appropriately
    print('Error editing customer: ${e.toString()}');
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