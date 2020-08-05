import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/bottomSheet.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/productSearch.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Na ovom dijelu koda radili Iva i Elvir
/// Kreiranje SearchDelegate klase sa njenim funkcijama koje cemo koristiti za kreiranje searcha,
//buildactions,buildLeading,buildresults,buildSuggestions
class DataSearch extends SearchDelegate<String> {

// Iva i Elvir, promjena teksta na search baru +
  ///dodatne promjene u search biblioteci searchdelegate klase.Sve promjene vezane za dizajn su u biblioteci.
  /// U narednim linijama code-a (200, 209) u searchu.dart biblioteka moralo je doci do izmjena da bi search bar bio u skladu sa nasom aplikacijom
  /// Izmjene su se morale odraditi direktno u klasi SearchDelegate
  /// Izmjene se ticu promjene boje bara, boje ikona, boje title-a
  /// Plus izmjena boje kursora na liniji 538
  /// promjena vrijednosti varijable na 203 liniji jer ThemeData povlaci vrijednosti
  /// iz biblioteke theme_data.dart, a kako nismo smijeli dirati izmjene te biblioteke morali smo odraditi drugacije
  /// Task radili: Elvir i Iva
  @override
  List<Widget> buildActions(BuildContext context) {
    ///Iva Elvir kreiranje buildAction funkcije
    return [
      IconButton(
        icon: Icon(Icons.clear),
        color: Colors.white,
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  ///Iva Elvir kreiranje buildLeadingfunkcije
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        color: Colors.white,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    ///Na ovom dijelu koda (buildResults) su radili : Faruk, Fahrudin i Amer
    ///OPIS LOGIKE: Kao što vidimo , definisane su dvije liste : products i selectedProducts.
    ///Ove dvije liste ćemo koristiti kako bi useru prikazali artikle koje on pretražuje na način da
    ///ćemo u listi products imati storane naše proizvode iz baze, a u listu selectedProduct ćemo puniti na osnovu toga šta
    ///user ukuca u search, te na osnovu te liste ćemo prikazivati željene produkte na screen.
    List<DocumentSnapshot> selectedProducts = List<DocumentSnapshot>();

    return Scaffold(
      floatingActionButton: email != null
          ? mainFloatingButton(email)
          : homeFloatingAnimatedButton(),
      bottomSheet: BottomSheetContainer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SearchPageFutureBuilder(
                query: query, selectedProducts: selectedProducts),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
    // final suggestionsList = query.isEmpty
    //     ? recentCars
    //     : cars.where((e) => e.startsWith(query)).toList();
    // return ListView.builder(
    //   itemBuilder: (context, index) => ListTile(
    //     onTap: () {
    //       showResults(context);
    //     },
    //     title: RichText(
    //       text: TextSpan(
    //           text: suggestionsList[index].substring(0, query.length),
    //           style:
    //               TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    //           children: [
    //             TextSpan(
    //                 text: suggestionsList[index].substring(query.length),
    //                 style: TextStyle(color: Colors.grey))
    //           ]),
    //     ),
    //   ),
    //   itemCount: suggestionsList.length,
    // );
  }
}
