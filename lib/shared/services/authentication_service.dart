
import 'package:firebase_auth/firebase_auth.dart';//importing firebase authentication
import 'package:cloud_firestore/cloud_firestore.dart';//importing firebase firestore

import '../models/puser.dart';//importing the user model


class SigninService{
  //firebase instances
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  SigninService(this._firebaseAuth,this._firebaseFirestore);
  
//Signin function returns a user object
Future<PUser?> SigninUser(  {required email , required password})async{
  try{
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    //using firebase auth with email and password
    User user = result.user!; // returns firebse user
    
    print(user);
   final docSnapshot =await getData(user.uid); //gets the document which has the user id
   if(docSnapshot != null){
    //loading the userdata from the firebase document to the  user object
   final userData =  PUser(
       access : docSnapshot?.data()?['access'],
     permission :docSnapshot?.data()?['permission'],
     photoUrl: docSnapshot?.data()?['photoUrl'],
     role :docSnapshot?.data()?['role'],
     FirstName :docSnapshot?.data()?['FirstName'],
     LastName: docSnapshot?.data()?['LastName'],
     branch : docSnapshot?.data()?['branch'],
     email :docSnapshot?.data()?['email'],
     uid:docSnapshot?.data()?['uid'],
   );
   print(userData);
   return userData;
   
   }
   else{
    print('there is no snapshot');
    return null;
   }
  } on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provide');
    }
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