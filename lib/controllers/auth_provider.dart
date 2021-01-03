import 'package:flutter/material.dart';
import 'package:simon/models/user.dart';
import 'package:simon/util/enums.dart';

class Auth extends ChangeNotifier {
  // auth state
  AuthState _state = AuthState.SIGNEDOUT;
  AuthState get state => _state;

  // signed in user
  User _currentUser;
  User get currentUser => _currentUser;

  Future<void> signIn(String email, String password,{isAdmin=true}) async {
    _state = AuthState.SIGNEDIN;

    _currentUser = User(
      "Test",
      "Tester",
      "email@provider.com",
      "77147912",
      "assets/2.png",
      DateTime(1996),
      "445",
      true,
      isAdmin: isAdmin
    );

    notifyListeners();
  }
}
