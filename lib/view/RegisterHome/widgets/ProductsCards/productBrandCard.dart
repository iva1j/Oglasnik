import 'dart:collection';

import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/getBrandData.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewBrand.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';
import 'dart:math';

// ignore: must_be_immutable
class ProductBrandCard extends StatefulWidget {
  final String categoryName;
  ProductBrandCard({Key key, @required this.categoryName}) : super(key: key);
  @override
  _ProductBrandCardState createState() => _ProductBrandCardState();
}

class _ProductBrandCardState extends State<ProductBrandCard> {
  List<String> listaSlika = [];

  // Task: dupliciranje random slika na ispisu (Elvir)
  bool listContains(int n, List<int> listaIntegera) {
    for (var x in listaIntegera) {
      if (n == x) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(widget.categoryName),
      ),
      floatingActionButton: email != null
          ? mainFloatingButton(email)
          : homeFloatingAnimatedButton(),
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: Color.fromARGB(255, 226, 11, 48),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
                future:
                    BrandViewModel().getBrandsByCategories(widget.categoryName),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    categoryBrand = snapshot.data
                        .map((doc) => Product.fromDocument(doc))
                        .toList();
                    return ListView.builder(
                        itemCount: categoryBrand.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ItemCard(
                                        brandNameScreen:
                                            categoryBrand[index].productBrand,
                                      )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(
                                        5, 5), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 5,
                                top: SizeConfig.blockSizeVertical * 4,
                                //bottom: SizeConfig.blockSizeVertical * 2,
                              ),
                              child: Container(
                                height: SizeConfig.blockSizeVertical * 25,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: SizeConfig
                                                      .blockSizeHorizontal *
                                                  3,
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      2,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            ItemCard(
                                                              brandNameScreen:
                                                                  categoryBrand[
                                                                          index]
                                                                      .productBrand,
                                                            ))); //#TODO: Ubaciti ispravnu putanju
                                              },
                                              child: Text(
                                                categoryBrand[index]
                                                    .productBrand,
                                                style: TextStyle(
                                                  fontSize: SizeConfig
                                                          .safeBlockHorizontal *
                                                      5,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                left: SizeConfig
                                                        .blockSizeHorizontal *
                                                    3,
                                                top: SizeConfig
                                                        .blockSizeVertical *
                                                    1,
                                              ),
                                              child: Text(
                                                  'U ovoj kategoriji nalazi se 123 Audi')),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            right:
                                                SizeConfig.blockSizeHorizontal *
                                                    3,
                                            top: SizeConfig.blockSizeVertical *
                                                2,
                                            bottom:
                                                SizeConfig.blockSizeVertical *
                                                    2,
                                          ),
                                          child: FutureBuilder(
                                            future: getBrandData(
                                                categoryBrand[index]
                                                    .productBrand),
                                            builder: (BuildContext context,
                                                AsyncSnapshot snapshot) {
                                              if (snapshot.hasData) {
                                                //Task: dupliciranje random slika na ispisu (Elvir)
                                                List<int> indexi = List<int>();
                                                var random = new Random();
                                                do {
                                                  final result = random.nextInt(
                                                      snapshot.data.length);
                                                  if (!listContains(
                                                      result, indexi))
                                                    indexi.add(result);
                                                } while (indexi.length < 4);
                                                return new GridView.count(
                                                  padding: EdgeInsets.all(0),
                                                  physics:
                                                      new NeverScrollableScrollPhysics(),
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 1,
                                                  crossAxisSpacing: 3,
                                                  mainAxisSpacing: 3,
                                                  children: <Widget>[
                                                    //Task: dupliciranje random slika na ispisu (Elvir)
                                                    Image.network(
                                                      snapshot.data[indexi[0]],
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Image.network(
                                                      snapshot.data[indexi[1]],
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Image.network(
                                                      snapshot.data[indexi[2]],
                                                      fit: BoxFit.cover,
                                                    ),
                                                    Image.network(
                                                      snapshot.data[indexi[3]],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ],
                                                  shrinkWrap: true,
                                                );
                                              } else {
                                                return Center(
                                                  child: SpinnerCircular(),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: SpinnerCircular(),
                    );
                  }
                }),
          ),
          //neki kom
          SizedBox(
            height: SizeConfig.blockSizeVertical * 6,
          ),
        ],
      ),
    );
  }
}
