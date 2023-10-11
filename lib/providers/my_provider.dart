import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/models/user_model.dart';
import 'package:to_do/shared/network/firebase/firebase_manager.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  UserModel? userModel;
  User? firebaseUser;

  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  initUser() async {
    firebaseUser = FirebaseAuth.instance.currentUser;
    userModel = await FirebaseManager.readUser(firebaseUser!.uid);
    notifyListeners();
  }

  changeTheme(ThemeMode temp) {
    mode = temp;
    notifyListeners();
  }
}
