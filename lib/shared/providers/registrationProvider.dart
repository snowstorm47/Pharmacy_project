

import 'dart:typed_data';

import 'package:clean_a/shared/services/UserRegistration.dart';
import 'package:clean_a/shared/services/authentication_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider =Provider((ref)=> FirebaseAuth.instance);
final firestoreProvider = Provider((ref)=>FirebaseFirestore.instance);
final fireStorageProvider = Provider((ref)=> FirebaseStorage.instance);
final registerServiceProvider = Provider((ref) {
  final firebaseAuth = ref.read(firebaseAuthProvider); // Assuming FirebaseAuth provider
  final firebaseStorage =  ref.read(fireStorageProvider);
  final firebaseFirestore = ref.read(firestoreProvider);// Assuming FirebaseStorage provider

  return RegisterService(firebaseAuth, firebaseStorage,firebaseFirestore);
});
 final imageProvider = StateProvider<Uint8List?>((ref) => null);
 final csvProvider = StateProvider<List<List<dynamic>>?>((ref)=>null);
 final userProvider=StreamProvider<User?>((ref)=>
 ref.watch(firebaseAuthProvider).authStateChanges());
final SigninServiceProvider = Provider((ref) {
  final firebaseAuth = ref.read(firebaseAuthProvider); // Assuming FirebaseAuth provider 
  final firebaseFirestore = ref.read(firestoreProvider);// Assuming FirebaseStorage provider

  return SigninService(firebaseAuth, firebaseFirestore);
});

