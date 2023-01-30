import 'package:flutter/material.dart';
import 'package:seneca_social/models/user.dart';
import 'package:seneca_social/services/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser {
    return _user!;
  }

  Future<void> refreshUser() async {
    _user = await _authMethods.getUserDetails();
    notifyListeners();
  }
}
