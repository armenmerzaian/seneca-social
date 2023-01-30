import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String profileImgUrl;
  final String email;
  final String fullname;
  final String username;
  final String biography;
  final List followers;
  final List following;
  final List peers;

  const User({
    required this.uid,
    required this.profileImgUrl,
    required this.email,
    required this.fullname,
    required this.username,
    required this.biography,
    required this.followers,
    required this.following,
    required this.peers,
  });

  Map<String, dynamic> toJSON() {
    return {
      "uid": uid,
      "profileImgUrl": profileImgUrl,
      "email": email,
      "fullname": fullname,
      "username": username,
      "biography": biography,
      "followers": followers,
      "following": following,
      "peers": peers,
    };
  }

  static User fromDocumentSnap(DocumentSnapshot docSnap) {
    Map snapshot = docSnap.data() as Map<String, dynamic>;
    return User(
      uid: snapshot['uid'],
      profileImgUrl: snapshot['profileImgUrl'],
      email: snapshot['email'],
      fullname: snapshot['fullname'],
      username: snapshot['username'],
      biography: snapshot['biography'],
      followers: snapshot['followers'],
      following: snapshot['following'],
      peers: snapshot['peers'],
    );
  }
}
