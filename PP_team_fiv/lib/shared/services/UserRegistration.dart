
//function picking user picture with web image picker(only picks on web browser)
import 'dart:typed_data';

import 'package:app/shared/models/puser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker_web/image_picker_web.dart';

Future<Uint8List?> pickImage() async { 
  Uint8List? bytes = await ImagePickerWeb.getImageAsBytes();//reads the image as Uint8List
  
  return bytes;
}



//Class responsible for user registration
class RegisterService{
 //firebase instances
  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _firebaseFirestore;
 RegisterService(this._firebaseAuth,this._firebaseStorage, this._firebaseFirestore);

//function returning the user object
 Future<PUser?>  registerUser(
   {required String branch, required String role, required String email, required String password, required String FirstName, required String LastName,required List<String> permission, required List<String> access, Uint8List? bytes}) async
 {
  try{
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    User user=result.user!;//capturing the firebase user object

    print(user);
   
   if(user==null){
    print('the user not registered');
    return null;
   }
    else{
      //uploading the profile image to the firebase storage
      await  uploadProfileImage(user.uid, bytes);
      //getting the  url of the image
       await getDownloadUrl(user.uid);
       print(await getDownloadUrl(user.uid));
    //loading the data into the user object 
        final userData = PUser(
         access: access, 
         permission: permission, 
         photoUrl:  bytes!=null?await getDownloadUrl(user.uid):null, 
         role: role,
         uid: user.uid,
         FirstName: FirstName,
         LastName: LastName,
          branch: branch.isEmpty?null:branch,
             email: email,

      );
     //saving the data to the firebase firestore document
       await _firebaseFirestore.collection('users').doc(user.uid).set(userData.toMap());
       //returning the userdata as user object
       return userData;
      
        }
     
 
      
    } catch(e){
          print(e.toString());
          return null;
        }
 }
 //function responsible for uploading image
Future<void> uploadProfileImage(String uid, Uint8List? bytes) async {
  print(uid);

  if (bytes == null) return;
//counter for retrying to upload to the firebase storage
  for (int retryCount = 0; retryCount < 3; retryCount++) {
    try {
      //uploading to the firebase storage
      final imageRef = _firebaseStorage.ref().child('profile/$uid');
//setting the image data as 'jpeg'
      await imageRef.putData(bytes,SettableMetadata(contentType:"jpeg"));
      return; // Success, break out of loop
    } on FirebaseException catch (e) {
         print(e.toString());
   
    }
  }

  // If all retries fail, handle the error gracefully
  print('Failed to upload image after all retries.');
}
//function responsible for getting the url of the image
Future<String> getDownloadUrl(String uid) async {
  final imageRef = _firebaseStorage.ref().child('profile/$uid');
  final url = await imageRef.getDownloadURL();

  return url;
  
 }
}