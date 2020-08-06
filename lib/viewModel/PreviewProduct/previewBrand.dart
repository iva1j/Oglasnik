import 'package:Oglasnik/interface/productInterface.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class BrandViewModel implements ReadBrandInterface {
  @override

  /// U sljedecim linijama code-a vidimo logiku koja se zasniva na sljedecem
  /// Future metoda getBrandsByCategories prima kao parametar categoryName, a koja
  /// je ujedno async metoda, vrsi upit nad bazom i dohvaca neke podatke.
  /// Zamisao je da dohvati kolekciju pod imenom products gdje je dokument productCategory
  /// jednak polju categoryName i to se smjesta u listu ispod
  Future getBrandsByCategories(String categoryName) async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection('products')
        .where('productCategory', isEqualTo: categoryName)
        .getDocuments();

    List<DocumentSnapshot> l = qn.documents;

    /// Sljedece linije code-a objasnjavaju poredjenje sortirane vrijednosti iz liste
    /// Logika se zasniva na brojacu koji ima uslov da ide od pocetka do kraja liste te
    /// koji se povecava ili brise u zavisnosti da li imamo poredjenje vrijednosti ili nemamo
    l.sort((a, b) => a['productBrand'].compareTo(b['productBrand']));
    int i = 0;
    while (i < l.length - 1) {
      if (l[i]['productBrand'] == l[i + 1]['productBrand'])
        l.removeAt(i + 1);
      else
        i++;
    }
    print("AAAAAAAAAA");
    print(l);
    print("BBBBBBBBB");
    return l;
    //return qn;
  }
}
