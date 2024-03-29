import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //add post image to firebase storage
  Future<String> uploadPostImageToStorage(
      String childName, Uint8List file) async {
    Reference ref =
        _storage.ref().child('postImages').child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  //add profile image to firebase storage
  Future<String> uploadProfileImageToStorage(
      String childName, Uint8List file) async {
    Reference ref =
        _storage.ref().child('profileImages').child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  //delete profile image from firebase storage
  Future<void> deleteProfileImage(String? uid) async {
    Reference ref =
        _storage.ref().child('profileImages').child(_auth.currentUser!.uid);
    await ref.delete();
  }
}
