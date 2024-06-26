
import 'package:clean_a/customer/domain/entities/corp_employee.dart';
import 'package:clean_a/customer/domain/entities/customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

Future<List<List<dynamic>>?> pickAndReadCsv() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: false, // Only allow selecting a single file
    type: FileType.custom,
    allowedExtensions: ['csv']  // Allow any file type for now (adjust as needed)
  );

  if (result != null) {
    final file = result.files.single.bytes;
    if(file!= null){
    final csvList = const CsvToListConverter(eol:'\n').convert(String.fromCharCodes(file));
    return csvList;
    }
  } else {
    // Handle case where no file is selected (optional)
    return null;
  }
  return null;
}

class CustomerRepo{
 final FirebaseFirestore _firebaseFirestore;
  CustomerRepo(this._firebaseFirestore);
 

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
    
   final customerRef = _firebaseFirestore.collection('Customer');
   final csvData = empData;
     corporateCustomer customer = corporateCustomer(
      companyAddress: companyAddress, 
     paymentTerms: paymentTerms,
     companyContact: companyContact, 
     companyEmail: companyEmail,
     companyName: companyName,
     companyPhone: companyPhone,
     creditLimit: creditLimit,
     details: details, 
     emergencyContact: emergencyContact,
     medicalInsuranceProvider: medicalInsuranceProvider,
     policyNumber: policyNumber
            );
            await customerRef.doc(companyName).set(customer.toMap());
final employeeRef = _firebaseFirestore.collection('employees');
   try{
   if(csvData != null){
     var info = <Map<String,dynamic>> [];
    
      for (final row in csvData.skip(1)) { // Skip the header row (assuming the first row has column names)
    if (row.length >= 10) { // Ensure enough columns for name, description, and price
      final employeeId = row[0] as String;
      final company = row[1] as String ;
      final firstName = row[2]as String;
      final lastName = row[3] as String;
      final email = row[4] as String;
      final address= row[5] as String;
      final city = row[6] as String;
      final subCity = row[7] as String;
      final role = row[8] as String;
      final details = row[9] as String;
       var employee =  Corpemployee(
       employeeId: employeeId,
       firstName:firstName,
        lastName:lastName,
        email:email,
        company:company,
        address:address,
        city:city,
        subCity:subCity,
        role:role,
        details:details,
       credit:0,
       );
       info.add(employee.toMap());
    } else {
      print('Invalid row: ${row.join(",")}'); // Handle invalid rows (optional)
    }
  }
           print(info);
    for(final employeeData in info){
       if(employeeData!= null){
        final employee = employeeData;
        await employeeRef.doc(employee['employeeId']).set(employee);
       }
       else{
        print('there is problem here');
       }
    }
   }}
   catch(e){
    print(e.toString());
   }
  }

 //adds credit customer to a specific company
  Future<void> addCorpCustomer({
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
  })async{
 
 final  customerRef = _firebaseFirestore.collection('Customer').doc(company);
final employee = Corpemployee(
              credit:0,
              company: company, 
               email: email,
              employeeId: employeeId,
              firstName: firstName,
              lastName: lastName,
              address: address,
              city: city, 
            details: details,
            role: role,
          subCity: subCity);
 final transaction = await _firebaseFirestore.runTransaction((transaction)async{
 final docSnapshot = await transaction.get(customerRef);
  if(docSnapshot.exists){
  final employeeRef = _firebaseFirestore.collection('employees').doc(employeeId);
  await employeeRef.set(employee.toMap());
}
 
  }); 
 if(transaction!=null){
  print('Employee added successfully');
 } 
 else{
  print('falied to added employee');
 }
  }


//finds the authorized customer
Future<List<Object>?> findCustomer(String company, String searchString) async {
  final customerRef = _firebaseFirestore.collection('Customer').doc(company);

  try {
    final docSnapshot = await customerRef.get();
    if (docSnapshot.exists) {
      final employeeRef = _firebaseFirestore.collection('employees');
      final searchItem= searchString.toLowerCase();
      final query = employeeRef.where('firstName',isGreaterThanOrEqualTo:searchItem);
        return query.get().then((querySnapshot) {
    print(querySnapshot.docs); // Print retrieved documents
     return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  });
    }
  } catch (error) {
    // Handle errors (e.g., document not found, network issues)
    print('Error finding the  customer: $error');
  }

  return null; // Return null if not found
}

// returns list of customers from different companies
Future<List<Object>?> getAllcustomers() async {
  final customerRef = _firebaseFirestore.collection('Customer');
  try {
    final querySnapshot = await customerRef.get();
    for (final docSnapshot in querySnapshot.docs) {
      final companyData = docSnapshot.data()!;
      final companyName = companyData['companyName'] as String;
      final employeeRef = _firebaseFirestore.collection('employees');
      QuerySnapshot employeeSnapshot = await employeeRef.get();
       if(employeeSnapshot!= null){
        return employeeSnapshot.docs.map((doc)=>doc.data() as Map<String, dynamic>).toList();
       }
       else{
        continue;
       }
    }
  } catch (error) {
    // Handle errors (e.g., network issues)
    print('Error getting products: $error');
  }

  return null;
}

Future<void> addCredit(String company, String id, double price) async{

  final customerRef =  _firebaseFirestore.collection('Customer').doc(company);
   DocumentSnapshot customerSnapshot = await customerRef.get();
  if(customerSnapshot.exists){
    final limit =customerSnapshot.get('creditLimit');
    print(limit);
    if(limit >= price){
      final employeeRef =  _firebaseFirestore.collection('employees').doc(id);
        DocumentSnapshot employeeSnapshot = await employeeRef.get();
           try {
    // Prepare update data
       final employeeData = employeeSnapshot.data() as Map<String,dynamic>;
       employeeData['credit']= price;
    // Update the property
   await employeeRef.set(employeeData);
    print('Property updated successfully!');
  } catch (error) {
    print('Error updating property: $error');
  }
    } 
  }

}



}