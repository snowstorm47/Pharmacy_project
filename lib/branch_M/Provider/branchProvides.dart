

import 'package:clean_a/branch_M/data/repositories/branch_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';


final firestoreProvider = Provider((ref)=>FirebaseFirestore.instance);
final RegisterBranchProvider = Provider((ref) {


  final firebaseFirestore = ref.read(firestoreProvider);// Assuming FirebaseStorage provider

  return RegisterBranch(firebaseFirestore);
});

final branchProvider = Provider<Future<List<Map<String, dynamic>>>>((ref) {
  final firebaseFirestore = ref.read(firestoreProvider); // Assuming you have a provider for Firestore
  return getBranches(firebaseFirestore);
});

Future<List<Map<String, dynamic>>> getBranches(FirebaseFirestore firestore) async {
  final collection = firestore.collection('Branch');
  final snapshot = await collection.get();
  return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
}