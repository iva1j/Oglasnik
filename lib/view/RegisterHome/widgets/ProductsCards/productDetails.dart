import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/phoneNumberButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/phoneNumberWidget.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsCategory.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsDesc.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsLocation.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/productDetailsTags.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/oglasTag.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Oglasnik/utils/strings.dart';
import '../showimage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/showimage.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';

class ProductDetails extends StatefulWidget {
  final String productNameScreen;
  ProductDetails({
    Key key,
    @required this.productNameScreen,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final List imageSlider = [];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text(widget.productNameScreen),
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      floatingActionButton: email != null
          ? mainFloatingButton(email)
          : homeFloatingAnimatedButton(),
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: Color.fromARGB(255, 226, 11, 48),
      ),
      body: FutureBuilder(
        future: Firestore.instance
            .collection('products')
            .where('productName', isEqualTo: widget.productNameScreen)
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
            // Ovaj file nije moguce vise refaktorisan zbog privatne liste imageSlider
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
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black26,
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
                                border: Border.all(color: Color(0x40080808)),
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
                              margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockSizeHorizontal * 5,
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
                            productDetailsTagsWidget(index),
                          ],
                        ),
                      ),
                    ),
                    Container(
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
