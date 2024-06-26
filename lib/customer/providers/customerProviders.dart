

import 'package:clean_a/customer/data/repositories/customer_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';

final firestoreProvider= Provider((ref){
  return FirebaseFirestore.instance;
});

final customerRepoProvider= Provider((ref) {

final firebaseFireStore = ref.read(firestoreProvider);
 
 return CustomerRepo(
  
  firebaseFireStore,

 );

});