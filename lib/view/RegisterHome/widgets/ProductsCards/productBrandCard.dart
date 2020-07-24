import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewBrand.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/uniqueBrands.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<int> numberOfProductsPerBrand(String brandName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('brandName', isEqualTo: brandName)
      .getDocuments();
  final List<DocumentSnapshot> documents = productsQuery.documents;
  return documents.length;
}

// ignore: must_be_immutable
class ProductBrandCard extends StatefulWidget {
  final String categoryName;
  ProductBrandCard({Key key, @required this.categoryName}) : super(key: key);

  @override
  _ProductBrandCardState createState() => _ProductBrandCardState();
}

class _ProductBrandCardState extends State<ProductBrandCard> {
  List<Widget> images = new List<Widget>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    images.add(Image.asset(
      'assets/img4.jpg',
      fit: BoxFit.cover,
    ));
    images.add(Image.asset(
      'assets/images/yoda.jpg',
      fit: BoxFit.cover,
    ));
    images.add(Image.asset(
      'assets/images/audi4.jpg',
      fit: BoxFit.cover,
    ));
    images.add(Image.asset(
      'assets/images/shoes.jpg',
      fit: BoxFit.cover,
    ));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.categoryName),
      ),
      floatingActionButton: mainFloatingButton(email),
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: Color.fromARGB(255, 226, 11, 48),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: SizeConfig.blockSizeVertical * 10,
          ),
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
                          return Container(
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
                              //top: SizeConfig.blockSizeVertical * 5,
                              bottom: SizeConfig.blockSizeVertical * 5,
                            ),
                            // margin: EdgeInsets.symmetric(
                            //   horizontal: SizeConfig.blockSizeHorizontal * 5,
                            //   vertical: SizeConfig.blockSizeVertical * 5,
                            // ),
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
                                            left:
                                                SizeConfig.blockSizeHorizontal *
                                                    3,
                                            top: SizeConfig.blockSizeVertical *
                                                2,
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                      builder: (_) => ItemCard(
                                                            brandNameScreen:
                                                                categoryBrand[
                                                                        index]
                                                                    .productBrand,
                                                          ))); //#TODO: Ubaciti ispravnu putanju
                                            },
                                            child: Text(
                                              categoryBrand[index].productBrand,
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
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      1,
                                            ),
                                            child:
                                                // FutureBuilder(
                                                //   future: numberOfProductsPerBrand(
                                                //       categoryBrand[index].productBrand),
                                                //   builder: (BuildContext context,
                                                //       AsyncSnapshot snapshot) {
                                                //     numberofBrands = snapshot.data.documents
                                                //         .map((doc) =>
                                                //             Product.fromDocument(doc))
                                                //         .toList();
                                                //     if (snapshot.hasData)
                                                //       return Text(
                                                //           'U ovoj kategoriji nalazi se: ');
                                                //     else
                                                //       return null;
                                                //   },
                                                // ),
                                                Text(
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
                                          top: SizeConfig.blockSizeVertical * 2,
                                          bottom:
                                              SizeConfig.blockSizeVertical * 2,
                                        ),
                                        child: new GridView.count(
                                          padding: EdgeInsets.all(0),
                                          physics:
                                              new NeverScrollableScrollPhysics(),
                                          crossAxisCount: 2,
                                          childAspectRatio: 1,
                                          crossAxisSpacing: 3,
                                          mainAxisSpacing: 3,
                                          children: images,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
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
          SizedBox(
            height: SizeConfig.blockSizeVertical * 4,
          ),
        ],
      ),
    );
  }
}
