import 'package:flutter/material.dart';

import '../../../../../utils/shared/globalVariables.dart';
import 'itemProductWidgets/itemProductContainer.dart';

///Fahrudin
///
///Funkcija koju pozivamo nakon sto unesemo neki query po kojem zelimo pretrazivati proizvode. Napisana je iz razloga
///sto prilikom search-anja proizovda prema nekom upitu imamo 2 slucaja i u oba nam je potrebna inicijalizacija
///data na sljedeci nacin. Listu allProducts, koju smo inicijalizirali prilikom startanja aplikacije svim (nezavrsenim)
///proizvodima u bazi, pretrazujemo i trazimo za svaki njen proizvod da li u sebi ima upit kao zasebnu rijec.
///U slucaju da ima (i da nije vec dodana)
void initSelectedProducts(String query) {
  selectedProductsGlobal.clear();

  allProducts.forEach((element) {
    if (((element['productName']
                .toLowerCase()
                .toString()
                .startsWith(query.toLowerCase() + ' ')) ||
            (element['productName']
                .toLowerCase()
                .toString()
                .endsWith(' ' + query.toLowerCase())) ||
            element['productName']
                .toLowerCase()
                .contains(' ' + query.toLowerCase() + ' ') ||
            element['productName'].toString().toLowerCase() ==
                query.toLowerCase()) &&
        !selectedProductsGlobal.contains(element))
      selectedProductsGlobal.add(element);
  });
}
