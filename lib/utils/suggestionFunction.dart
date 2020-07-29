import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:flutter/animation.dart';

List<String> citysuggestions = [
  'Sarajevo',
  'London',
  'Lisabon',
  'Berlin',
  'New York',
  'Beč',
  'Madrid',
  'Rim',
  'Bukurešt',
  'Moskva',
  'Kopenhagen',
  'Basel',
  'Pariz'
];

bool onWillPop() {
  pageController.previousPage(
    duration: Duration(milliseconds: 800),
    curve: Curves.ease,
  );
  return false;
}
