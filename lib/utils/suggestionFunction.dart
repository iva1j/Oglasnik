import 'package:Oglasnik/view/PostScreens/pages/articlePage.dart';
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


  bool onWillPop() {
    pageController.previousPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    return false;
  }