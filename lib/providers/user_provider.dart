// lib/providers/user_provider.dart
import 'package:flutter/foundation.dart';
import 'package:red_sportswear/models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;
  bool get isLoggedIn => _user != null;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void clear() {
    _user = null;
    notifyListeners();
  }
}
