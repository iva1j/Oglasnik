import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:flutter/animation.dart';

class Proizvodjac {
  static final List<String> proizvodjac = [
    'Yoda',
    'Mercedes',
    'BMW',
    'Google',
    'facebook',
    'Yahoo',
    'Marvel',
    'Milka',
    'Zara',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(proizvodjac);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    if (query.length >= 3)
      return matches;
    else
      return null;
  }
}

List<String> suggestions = [
  "Apple",
  "Microsoft",
  "Tefal",
  "Audi",
  "Beko",
];

bool onWillPop() {
  pageController.previousPage(
    duration: Duration(milliseconds: 200),
    curve: Curves.linear,
  );
  return false;
}
