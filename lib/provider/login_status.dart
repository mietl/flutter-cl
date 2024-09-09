import 'package:flutter/material.dart';

class LoginStatusProvider extends ChangeNotifier {
  bool _isLogin = false;
  bool get isLogin => _isLogin;

  void updateLoginStatus(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }
}
