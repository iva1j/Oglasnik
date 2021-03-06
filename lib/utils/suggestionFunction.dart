import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:flutter/animation.dart';

List<String> citysuggestions = [
  'Apatin',
  'Aranđelovac',
  'Bačka Palanka',
  'Bačka Topola',
  'Banja Luka',
  'Bečej',
  'Belgrade',
  'Bihać',
  'Bijeljina',
  'Bjelovar',
  'Bor',
  'Bosanska Krupa',
  'Brčko',
  'Bugojno',
  'Cazin',
  'Čačak',
  'Čakovec',
  'Ćuprija',
  'Doboj',
  'Dubrovnik',
  'Goražde',
  'Gornji Milanovac',
  'Gračanica',
  'Gradačac',
  'Inđija',
  'Jagodina',
  'Karlovac',
  'Kikinda',
  'Knjazevac',
  'Konjic',
  'Koprivnica',
  'Kragujevac',
  'Kraljevo',
  'Kruševac',
  'Lazarevac',
  'Leskovac',
  'Mostar',
  'Negotin',
  'Niš',
  'Nova Pazova',
  'Novi Pazar',
  'Novi Sad',
  'Obrenovac',
  'Osijek',
  'Pančevo',
  'Pirot',
  'Požarevac',
  'Požega',
  'Prijedor',
  'Prokuplje',
  'Pula',
  'Rijeka',
  'Ruma',
  'Samobor',
  'Sarajevo',
  'Senta',
  'Sesvete',
  'Sisak',
  'Slavonski Brod',
  'Smederevo',
  'Smederevska Palanka',
  'Solin',
  'Sombor',
  'Split',
  'Sremčica',
  'Sremska Mitrovica',
  'Stara Pazova',
  'Subotica',
  'Šabac',
  'Šibenik',
  'Travnik',
  'Trebinje',
  'Trstenik',
  'Tuzla',
  'Užice',
  'Valjevo',
  'Varaždin',
  'Velika Gorica',
  'Velika Kladuša',
  'Vinkovci',
  'Virovitica',
  'Visoko',
  'Vranje',
  'Vrbas',
  'Vršac',
  'Vukovar',
  'Zadar',
  'Zagreb',
  'Zagreb - Centar',
  'Zagreb- Stenjevec',
  'Zaječar',
  'Zaprešić',
  'Zemun',
  'Zenica',
  'Zrenjanin',
];

List<String> selectedChips = List<String>();

bool onWillPop() {
  pageController.previousPage(
    duration: Duration(milliseconds: 800),
    curve: Curves.ease,
  );
  return false;
}
