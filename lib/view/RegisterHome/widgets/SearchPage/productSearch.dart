import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/actionChips.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/dynamicChips.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/Search/getProductsByBrand.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPageFutureBuilder extends StatefulWidget {
  SearchPageFutureBuilder({
    Key key,
    @required this.query,
  }) : super(key: key);
  @override
  final String query;
  _SearchPageFutureBuilderState createState() =>
      _SearchPageFutureBuilderState();
}

class _SearchPageFutureBuilderState extends State<SearchPageFutureBuilder> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool showMessage = true;
    List<DocumentSnapshot> products = List<DocumentSnapshot>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 7,
                top: SizeConfig.blockSizeVertical * 2),
            child: Text(
              FilterTitle().filterNaslov,
              style: TextStyle(fontSize: 16.0),
            )),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ActionChipsWidget(refresh),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DynamicChipsWidget(refresh),
        ),
        Expanded(
          child: allBrands.contains(widget.query.toLowerCase())
              ? FutureBuilder(
                  /// Future funkcija koja je zadužena za povlačenje proizvoda iz baze:
                  future: getProductsPerBrand(widget.query.toLowerCase()),

                  builder: (BuildContext context, AsyncSnapshot snapshott) {
                    if (snapshott.hasData) {
                      showingSelectedProducts(products, snapshott, true);

                      ///Handlovanje slučaja da u bazi nema niti jednog artikla koji je user tražio:
                      return selectedProducts == null ||
                              selectedProducts.isEmpty
                          ? Center(
                              child: Text(TrazeniProizvod().trazeniProizvod),
                            )
                          : ItemProductContainer(
                              selectedProducts: selectedProducts,
                              showMessage: showMessage);
                    } else {
                      //prikazivanje spinnera, u slučaju da učitavanje potraje malo duže
                      return CategoryLoading();
                    }
                  },
                )
              : FutureBuilder(
                  /// Future funkcija koja je zadužena za povlačenje proizvoda iz baze:
                  future:
                      Firestore.instance.collection('products').getDocuments(),

                  builder: (BuildContext context, AsyncSnapshot snapshott) {
                    if (snapshott.hasData) {
                      showingSelectedProducts(products, snapshott, false);

                      ///Handlovanje slučaja da u bazi nema niti jednog artikla koji je user tražio:
                      return selectedProducts == null ||
                              selectedProducts.isEmpty
                          ? Center(
                              child: Text(TrazeniProizvod().trazeniProizvod),
                            )
                          : ItemProductContainer(
                              selectedProducts: selectedProducts,
                              showMessage: showMessage);
                    } else {
                      //prikazivanje spinnera, u slučaju da učitavanje potraje malo duže
                      return CategoryLoading();
                    }
                  },
                ),
        ),
      ],
    );
  }

  void showingSelectedProducts(List<DocumentSnapshot> products,
      AsyncSnapshot snapshott, bool brandEntered) async {
    products.clear();
    brandEntered
        ? products = snapshott.data
        : products = snapshott.data.documents;
    selectedProducts.clear();
    /*Korištenjem forEach metode popunjavamo selectedProducts listu, ,na način da userov unos
    u search (query) , poredimo sa 'productName' koji je neki user unio pri kreiranju artikla */

    ///Fahrudin
    ///
    ///OG-205 (search query (hint: puma))
    ///
    ///Nakon sto povucemo sve brandove iz svake kategorije (pomocu jednostavne funkcije iz getAllBrands.dart fajla koja
    ///vraca nazive svih brandova malim slovima) gledamo da li query pretvoren u mala slova pripada nekom od njih i ako
    ///pripada povlacimo sve produkte iz baze sa tim nazivom brenda i smjestamo u odabrane proizvode. Ovo je ovako moralo
    ///biti uradjeno posto korisnik moze unijeti npr. i puma/Puma/PUMA itd. i u svakom slucaju bi trebalo da ispise
    ///proizvode brand-a puma.

    if (brandEntered) {
      selectedProducts.addAll(products);
      products.forEach((element) {
        if (((element['productName']
                        .toLowerCase()
                        .contains(widget.query.toLowerCase() + ' ') &&
                    element['productName']
                        .toLowerCase()
                        .toString()
                        .startsWith(widget.query.toLowerCase())) ||
                (element['productName']
                        .toLowerCase()
                        .contains(' ' + widget.query.toLowerCase()) &&
                    element['productName']
                        .toLowerCase()
                        .toString()
                        .endsWith(widget.query.toLowerCase())) ||
                element['productName']
                    .toLowerCase()
                    .contains(' ' + widget.query.toLowerCase() + ' ') ||
                element['productName'].toString().toLowerCase() ==
                    widget.query.toLowerCase()) &&
            !selectedProducts
                .contains(element)) //Iva Elvir, omogucuje se ispis artikla bez
          ///obzira da li je user unio veliko ili malo slovo u search
          selectedProducts.add(element);
      });
    } else {
      products.forEach((element) {
        if ((element['productName']
                    .toLowerCase()
                    .contains(widget.query.toLowerCase() + ' ') &&
                element['productName']
                    .toLowerCase()
                    .toString()
                    .startsWith(widget.query.toLowerCase())) ||
            (element['productName']
                    .toLowerCase()
                    .contains(' ' + widget.query.toLowerCase()) &&
                element['productName']
                    .toLowerCase()
                    .toString()
                    .endsWith(widget.query.toLowerCase())) ||
            element['productName']
                .toLowerCase()
                .contains(' ' + widget.query.toLowerCase() + ' ') ||
            element['productName'].toString().toLowerCase() ==
                widget.query.toLowerCase()) selectedProducts.add(element);
      });
    }
  }
}
