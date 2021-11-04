import 'package:flutter/material.dart';

class DOGS extends ChangeNotifier {
  final List<String> _dogsNames = List.empty(growable: true);
  final List<String> _dogsUrls = List.empty(growable: true);

  set allNames(List<String> names) {
    names.forEach((e) => _dogsNames.add(e));
    notifyListeners();
  }

  set allUrls(List<String> names) {
    print("name " + names.first == "" ? "NULL" : names.first);
    names.forEach((e) => _dogsUrls.add(e));
    notifyListeners();
  }

  List<String> get dogsNames => _dogsNames;
  List<String> get dogsUrls => _dogsUrls;
}