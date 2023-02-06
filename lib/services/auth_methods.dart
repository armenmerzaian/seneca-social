import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seneca_social/models/user.dart' as model;
import 'package:seneca_social/utils/svg_strings.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromDocumentSnap(documentSnapshot);
  }

  //sign up the user
  Future<String> signUpUser({
    required String email,
    required String fullname,
    required String username,
    required String password,
  }) async {
    String res = "Error Has Occured!";

    try {
      if (email.isNotEmpty ||
          fullname.isNotEmpty ||
          username.isNotEmpty ||
          password.isNotEmpty) {
        //register the user
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        model.User user = model.User(
            uid: userCredential.user!.uid,
            profileImgUrl: defaultUserProfileUrl,
            email: email,
            fullname: fullname,
            username: username,
            biography: "",
            followers: [],
            following: [],
            peers: []);
        //add user to database
        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(user.toJSON());
        res = "success";
      } else {
        res = "Some Information Is Missing";
      }
    } on FirebaseAuthException catch (err) {
      switch (err.code) {
        case 'invalid-email':
          res = "Invalid Email Format";
          break;
        case 'email-already-in-use':
          res = "Email Already In Use";
          break;
        case 'weak-password':
          res = "Weak Password";
          break;
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //login the user
  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Error Has Occured!";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        //login the user
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Missing Information";
      }
    } on FirebaseAuthException catch (err) {
      switch (err.code) {
        case 'invalid-email':
          res = "Invalid Email Format";
          break;
        case 'user-disabled':
          res = "This Account Is Disabled";
          break;
        case 'user-not-found':
          res = "Incorrect Credentials";
          break;
        case 'wrong-password':
          res = "Incorrect Credentials";
          break;
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
