
import 'package:firebase_auth/firebase_auth.dart';//importing firebase authentication
import 'package:cloud_firestore/cloud_firestore.dart';//importing firebase firestore
import 'package:flutter/material.dart';

import '../models/puser.dart';//importing the user model


class SigninService {
  //firebase instances
final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
      final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
     
  // SigninService(this._firebaseAuth,this._firebaseFirestore);
// Signin function returns a user object
Future<PUser?> SigninUser({required String email, required String password}) async {
  try {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    User user = result.user!; // returns Firebase user
    
    print(user);
    
    final docSnapshot = await _firebaseFirestore.collection('users').doc(user.uid).get(); // gets the document which has the user id
    if (docSnapshot.exists) {
      // loading the user data from the Firebase document to the user object
      final docData = docSnapshot.data() as Map<String, dynamic>;
      final userData = PUser(
            access: (docData['access'] != null) ? List<String>.from(docData['access']) : [],
        permission: (docData['permission'] != null) ? List<String>.from(docData['permission']) : [],
        photoUrl: docData['photoUrl'] ?? '',
        role: docData['role'] ?? '',
        FirstName: docData['FirstName'] ?? '',
        LastName: docData['LastName'] ?? '',
        branch: docData['branch'] ?? '',
        email: docData['email'] ?? '',
        uid: docData['uid'] ?? '',
      );
      print(userData);
      return userData;
    } else {
      print('There is no snapshot');
      return null;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided.');
    }
  } catch (e) {
    print('Error: $e');
  }
  return null;
}

//function obtaining the document using the user id
Future<DocumentSnapshot<Map<String, dynamic>>?> getData(String uid) async {
    final DocRef= _firebaseFirestore.collection('users').doc('user.id');
   final docSnapshot = await DocRef.get();
  if (docSnapshot.exists) {
    return docSnapshot;
  } else {
    print("Document does not exist");
    return null;
  }
}
//function sending verification email
Future<void> verifyEmail() async{
  User? user = _firebaseAuth.currentUser;
  if (user!= null && !user.emailVerified) {
  await user.sendEmailVerification();
}
 else {
  return;
 }

}
//function for signing out 
Future<void> Signout() async{
 await _firebaseAuth.signOut();
}
//function sending password reset
Future<void> sendPasswordResetEmail({required email}) async {
  try {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    print('Password reset email sent!');
  } on FirebaseAuthException catch (error) {
    if (error.code == 'user-not-found') {
      print('No user found for this email.');
    } else {
      print('Error sending password reset email: $error');
    }
  }
}

}