import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/smallMainButton.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/PostScreens/Pages/articlePage.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/anonProductDetailsTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/phoneNumberButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/phoneNumberWidget.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsCategory.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsDesc.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsLocation.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:Oglasnik/viewModel/SplashViewModel/splashViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../deleteDialogButtons.dart';
import '../showimage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/showimage.dart';

import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';

class ProductDetails extends StatefulWidget {
  final String productNameScreen;
  final String productIdScreen;
  final Function setStateParent;
  ProductDetails({
    Key key,
    @required this.productNameScreen,
    @required this.productIdScreen,
    @required this.setStateParent,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _selectedIndex;
  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List imageSlider = [];
  @override
  Widget build(BuildContext context) {
    print(favoritesList);
    //getFavoriteProducts(email);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text(widget.productNameScreen),
        leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              if (widget.setStateParent != null) {
                widget.setStateParent();
              }
              Navigator.of(context).pop();
            }),
      ),
      floatingActionButton: email != null
          ? mainFloatingButton(email)
          : homeFloatingAnimatedButton(),
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: bottomSheetColor,
      ),
      body: FutureBuilder(
        future: Firestore.instance
            .collection('products')
            .where('productID', isEqualTo: widget.productIdScreen)
            .getDocuments(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            products = snapshot.data.documents
                .map((doc) => Product.fromDocument(doc))
                .toList();
            if (products[0].productImg1 != null) {
              imageSlider.add(products[0].productImg1);
            }
            if (products[0].productImg2 != null) {
              imageSlider.add(products[0].productImg2);
            }
            if (products[0].productImg3 != null) {
              imageSlider.add(products[0].productImg3);
            }
            if (imageSlider.length == 0) {
              imageSlider.add("assets/images/nophoto.jpg");
            }
            // Ovaj file nije moguce vise refaktorisati zbog privatne liste imageSlider
            return ListView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black26,
                          width: 0.2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 5,
                        vertical: SizeConfig.blockSizeVertical * 5,
                      ),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0x40080808), width: 0.8),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0)),
                              ),
                              width: SizeConfig.screenWidth,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                child: CarouselSlider(
                                  enableInfiniteScroll: false,
                                  initialPage: 0,
                                  viewportFraction: 1.0,
                                  aspectRatio: 1.5,
                                  items: imageSlider.map((imgUrl) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          child: GestureDetector(
                                            child: imgUrl ==
                                                    "assets/images/nophoto.jpg"
                                                ? Image.asset(
                                                    "assets/images/nophoto.jpg")
                                                : Image.network(
                                                    imgUrl,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                            onTap: () {
                                              print(
                                                  products[index].productName);
                                              print(
                                                  products[index].productImg1);
                                              print(index);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PrikazSlika(
                                                    listaSlika: imageSlider,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            productDetailsLocationWidget(index),
                            Container(
                              margin: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 5,
                                right: SizeConfig.blockSizeHorizontal * 3,
                                top: SizeConfig.blockSizeVertical * 1.1,
                                //bottom: SizeConfig.blockSizeVertical * 1,
                              ),
                              child: Row(children: <Widget>[
                                Container(
                                  width: 170.0,
                                  child: Text(
                                    widget.productNameScreen,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                Spacer(),
                                productDetailsCategoryWidget(index)
                              ]),
                            ),
                            productDetailsDescWidget(index),
                            Divider(
                              thickness: SizeConfig.blockSizeVertical * 0.2,
                              indent: 15,
                              endIndent: 15,
                            ),
                            email != null
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      productDetailsTagsWidget(index),
                                      Container(
                                        child: IconButton(
                                            color: Colors.white,
                                            icon: favoritesList.contains(
                                                    snapshot.data
                                                            .documents[index]
                                                        ['productID'])
                                                ? Icon(
                                                    Icons.star,
                                                    size: 30,
                                                    color: mainAppColor,
                                                  )
                                                : Icon(Icons.star_border,
                                                    size: 30,
                                                    color: starBorderColor),
                                            onPressed: () async {
                                              // FavoriteProduct().removeFavorite(
                                              //     email, products[index]);
                                              final result = favoritesList
                                                  .contains(snapshot
                                                          .data.documents[index]
                                                      ['productID']);
                                              if (result) {
                                                favoritesList.remove(snapshot
                                                        .data.documents[index]
                                                    ['productID']);

                                                await FavoriteProduct()
                                                    .removeFavorite(
                                                        email,
                                                        snapshot.data
                                                            .documents[index]);
                                              } else {
                                                favoritesList.add(snapshot
                                                        .data.documents[index]
                                                    ['productID']);
                                                await FavoriteProduct()
                                                    .addFavorite(
                                                        email,
                                                        snapshot.data
                                                            .documents[index]);
                                              }
                                              setState(() {});
                                            }),
                                      ),
                                    ],
                                  )
                                : anonProductDetailsTagsWidget(index),
                          ],
                        ),
                      ),
                    ),
                    products[index].email == email
                        ? Container(
                            margin: EdgeInsets.only(
                                bottom: SizeConfig.blockSizeVertical * 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                smallMainButton(UserProducts().editProfile, () {
                                  updateProductNameReturn = null;
                                  updateProductDescriptionReturn = null;
                                  updateProductPriceReturn = null;
                                  updateProductTagsReturn = null;
                                  img1 = immutableImg1;
                                  img2 = immutableImg2;
                                  img3 = immutableImg3;
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return ArticlePage(
                                      editProduct: UserProducts().editProduct,
                                      productSnapshot: products[index],
                                      productID: products[index].productID,
                                    );
                                  }));
                                }),
                                smallMainButton(UserProducts().finishProduct,
                                    () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            SuccessAlertDialog().obrisinaslov,
                                            style:
                                                TextStyle(color: mainAppColor),
                                          ),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      SuccessAlertDialog()
                                                          .obrisitext,
                                                      style: TextStyle(
                                                          color:
                                                              alertDialogTextColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          backgroundColor: successDialogBgColor,
                                          elevation: 10,
                                          actions: <Widget>[
                                            Container(
                                              width: double.maxFinite,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Container(
                                                    child: DeleteButtonDialog(
                                                      snapshot: products[index],
                                                    ),
                                                  ),
                                                  Container(
                                                    child:
                                                        OdustaniButtonDialog(),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        );
                                      });
                                }),
                              ],
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                bottom: SizeConfig.blockSizeVertical *
                                    16), // ne mijenjati
                            color: mainAppColor,
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.blockSizeVertical * 8,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 10,
                                    top: SizeConfig.blockSizeVertical * 1,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Transform.scale(
                                      scale: 1,
                                      child: Icon(
                                        Icons.call,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 5,
                                    right: SizeConfig.blockSizeHorizontal * 3,
                                    top: SizeConfig.blockSizeVertical * 1.5,
                                    //bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  child: phoneNumberWidget(index),
                                ),
                                phoneNumberButtonWidget(index),
                              ],
                            ),
                          ),
                  ],
                );
              },
            );
          } else {
            return Center(
              child: SpinnerCircular(),
            );
          }
        },
      ),
    );
  }
}

class CallsAndMessagesService {
  void call(String number) => launch("tel:$number");
}
