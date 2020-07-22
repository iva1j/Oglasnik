import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Oglasnik/utils/strings.dart';
import '../showimage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/logoutButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/showimage.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewProduct.dart';
import 'package:intl/intl.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppBarTheme.of(context).color,
          centerTitle: true,
          title: Text('Oglasnik'),
          leading: LogoutButton(),
        ),
        floatingActionButton: mainFloatingButton(email),
        bottomSheet: Container(
          height: 55,
          width: double.infinity,
          color: Color.fromARGB(255, 226, 11, 48),
        ),
        body: FutureBuilder(
            future: ProductViewModel().getProduct(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Product.fromDocument(doc))
                    .toList();
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
                                  offset: Offset(
                                      0, 3), // changes position of shadow
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
                              vertical: SizeConfig.blockSizeVertical * 10,
                            ),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: SizeConfig.screenWidth,
                                    child: Container(
                                      child: CarouselSlider(
                                        initialPage: 0,
                                        viewportFraction: 1.0,
                                        aspectRatio: 1.5,
                                        items: <String>[
                                          products[index].productImg1,
                                          products[index].productImg2,
                                          products[index].productImg3
                                        ].map((imgUrl) {
                                          return Builder(
                                            builder: (BuildContext context) {
                                              return Container(
                                                child: GestureDetector(
                                                  child: imgUrl == null
                                                      ? Image.asset(
                                                          "assets/images/nophoto.jpg")
                                                      : Image.network(
                                                          imgUrl,
                                                          fit: BoxFit.fitHeight,
                                                        ),
                                                  onTap: () {
                                                    print(products[index]
                                                        .productName);
                                                    print(products[index]
                                                        .productImg1);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                PrikazSlika(
                                                                    listaSlika: [
                                                                      products[
                                                                              index]
                                                                          .productImg1,
                                                                      products[
                                                                              index]
                                                                          .productImg2,
                                                                      products[
                                                                              index]
                                                                          .productImg3
                                                                    ])));
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal * 3),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            child: Icon(Icons.location_on)),
                                        Text(
                                          products[index].productLocation,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Spacer(),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top:
                                                  SizeConfig.blockSizeVertical *
                                                      1),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: Colors.white,
                                            border:
                                                Border.all(color: mainAppColor),
                                          ),
                                          child: Text(NumberFormat.currency(
                                                  locale: 'eu', symbol: 'KM')
                                              .format((double.parse(
                                                  products[index]
                                                      .productCijena)))),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.blockSizeHorizontal * 4,
                                        vertical:
                                            SizeConfig.blockSizeVertical * 2),
                                    child: Row(children: <Widget>[
                                      Container(
                                        child: Text(
                                          products[index].productName,
                                          //ProductDetailsStrings().productName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Text(
                                          //ProductDetailsStrings().categoryName
                                          products[index].productCategory,
                                        ),
                                      )
                                    ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.blockSizeHorizontal * 4,
                                    ),
                                    child: Text(
                                      products[index].productDesc,
                                    ),
                                  ),
                                  Divider(
                                    thickness:
                                        SizeConfig.blockSizeVertical * 0.2,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      child: Row(
                                        children: products[index]
                                            .productTag
                                            .split(',')
                                            .map<Widget>((element) =>
                                                new OglasTag(naziv: element))
                                            .toList(),
                                        /*
                                         <Widget>[
                                          OglasTag(naziv: "Sarajevo"),
                                          OglasTag(naziv: "Audi"),
                                          OglasTag(naziv: "Top"),
                                          OglasTag(naziv: "Sarajevo"),
                                          OglasTag(naziv: "Audi"),
                                          OglasTag(naziv: "Top"),
                                          OglasTag(naziv: "Sarajevo"),
                                          OglasTag(naziv: "Audi"),
                                          OglasTag(naziv: "Top"),
                                          OglasTag(naziv: "Sarajevo"),
                                          OglasTag(naziv: "Audi"),
                                          OglasTag(naziv: "Top"),
                                        ],*/
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            color: mainAppColor,
                            margin: EdgeInsets.only(
                                bottom: SizeConfig.blockSizeVertical * 10),
                            width: SizeConfig.screenWidth,
                            height: 50,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 8,
                                    top: SizeConfig.blockSizeVertical * 1,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 8,
                                    top: SizeConfig.blockSizeVertical * 1,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        products[index].phoneNumber == null
                                            ? 'Ne radi'
                                            : products[index].phoneNumber,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        ProductDetailsStrings().callInfoText,
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.all(
                                      SizeConfig.safeBlockHorizontal * 1),
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 8,
                                    top: SizeConfig.blockSizeVertical * 1,
                                    bottom: SizeConfig.blockSizeVertical * 1,
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(0))),
                                  child: FlatButton(
                                    onPressed: () => CallsAndMessagesService()
                                        .call(products[index].phoneNumber),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    color: mainAppColor,
                                    child: Text(
                                      ProductDetailsStrings().callText,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}

// class OglasTag extends StatelessWidget {
//   final String naziv;
//   const OglasTag({
//     Key key,
//     this.naziv,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(
//         left: SizeConfig.blockSizeHorizontal * 3,
//         top: SizeConfig.blockSizeVertical * 1,
//         bottom: SizeConfig.blockSizeVertical * 2,
//       ),
//       child: Text(
//         "#" + naziv,
//         style: TextStyle(
//           fontSize: SizeConfig.safeBlockHorizontal * 3,
//           fontWeight: FontWeight.w300,
//           color: Colors.blueAccent,
//         ),
//       ),
//     );
//   }
// }

// String number = '0000000';

class CallsAndMessagesService {
  void call(String number) => launch("tel:$number");
}
