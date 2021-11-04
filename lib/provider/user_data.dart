import 'package:flutter/material.dart';

class DATA extends ChangeNotifier {
  String email = "";
  String firstName = "";
  String lastName = "";
  late ImageProvider avatar;
  String _token = "";

  set userData(data) {
    email = data["email"];
    firstName = data["first_name"];
    lastName = data["last_name"];
    avatar = Image.network(data["avatar"]).image;
    notifyListeners();
  }
  set setToken(token) {
    _token = token;
    notifyListeners();
  }

  String get userEmail => email;
  String get userFistName => firstName;
  String get userLastName => lastName;
  ImageProvider get userAvatar => avatar;
  String get getToken => _token;
}