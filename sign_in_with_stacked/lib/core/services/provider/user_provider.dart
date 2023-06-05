import 'package:flutter/material.dart';

import '../../model/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    email: '',
    password: '',
    firstName: '',
    lastName: '',
    accessToken: '',
  );

  User get user => _user;

  void setUser(Map<String, dynamic> user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
