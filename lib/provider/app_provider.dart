import 'package:app_template/models/user_model.dart';
import 'package:app_template/shared/network/firebase/firebase_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode mode) async {
    themeMode = mode;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', themeMode == ThemeMode.light ? 'light' : 'dark');
  }

  String language = 'en';

  void changeLanguage(String lang) async {
    language = lang;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', language);
  }

  // void getSavedlogin (String email) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('email', email);
  //
  // }

  void getSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String language = prefs.getString('lang') ?? 'en';
    String theme = prefs.getString('theme') ?? 'light';
    String email = prefs.getString('email') ?? '';
    changeLanguage(language);
    changeTheme(theme == 'light' ? ThemeMode.light : ThemeMode.dark);
    // getSavedlogin(email);
  }

  UserModel? currentUser;
  User? firebaseUser;

  AppProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  void initUser() async {
    firebaseUser = FirebaseAuth.instance.currentUser;
    currentUser = await FirebaseFunctions.readUser(firebaseUser!.uid);
    notifyListeners();
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
