import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Oglasnik/utils/strings.dart';
import '../showimage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

class ProductDetails extends StatefulWidget {
  final String document, document2;
 const ProductDetails(this.document, this.document2);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  static List<String> imagesList = [
    "assets/img1.jpg",
    "assets/img2.jpg",
    "assets/img3.jpg",
    "assets/img4.jpg",
  ];
  final data = Data(imagesPass: imagesList);
  @override
  Widget build(BuildContext context) {
    String document;
    SizeConfig().init(context);
    return 
    Scaffold(
      body: 
      Column(
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
              vertical: SizeConfig.blockSizeVertical * 10,
            ),
            child: Container(
              // margin: EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  //Ivin slider
                  Container(
                    // height: SizeConfig.blockSizeVertical * 30,
                    width: SizeConfig.screenWidth,
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: alertDialogBorderColor),
                    //     borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Container(
                      child: CarouselSlider(
                        initialPage: 0,
                        viewportFraction: 1.0,
                        aspectRatio: 1.5,
                        items: imagesList.map((imgUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                child: GestureDetector(
                                  child: Image.asset(
                                    imgUrl,
                                    //fit: BoxFit.fitWidth,
                                    // height: SizeConfig.blockSizeVertical*20,
                                    // width: SizeConfig.blockSizeHorizontal*100,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PrikazSlika(data: data)));
                                  },
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  //prvi elementi Faruk
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3),
                    child: Row(
                      children: <Widget>[
                        Container(child: Icon(Icons.location_on)),
                        Text(
                          ProductDetailsStrings().cityLocation,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                            border: Border.all(color: mainAppColor),
                          ),
                          child: Text(ProductDetailsStrings().productPriceText),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 4,
                        vertical: SizeConfig.blockSizeVertical * 2),
                    child: Row(children: <Widget>[
                      Container(
                        child: Text(
                          widget.document,
                          //ProductDetailsStrings().productName,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Text(
                          //ProductDetailsStrings().categoryName
                          widget.document2
                          ),
                      )
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 2),
                    child: Text(ProductDetailsStrings().productTestDesc),
                  ),
                  Divider(
                    thickness: SizeConfig.blockSizeVertical * 0.2,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: <Widget>[
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: mainAppColor,
            margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 10),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        //ProductDetailsStrings().callNumberText
                        document,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        ProductDetailsStrings().callInfoText,
                        style: TextStyle(
                            color: Colors.white60, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 1),
                  margin: EdgeInsets.only(
                    right: SizeConfig.blockSizeHorizontal * 8,
                    top: SizeConfig.blockSizeVertical * 1,
                    bottom: SizeConfig.blockSizeVertical * 1,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  child: FlatButton(
                    onPressed: () => CallsAndMessagesService().call(number),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: mainAppColor,
                    child: Text(
                      ProductDetailsStrings().callText,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OglasTag extends StatelessWidget {
  final String naziv;
  const OglasTag({
    Key key,
    this.naziv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 3,
        top: SizeConfig.blockSizeVertical * 1,
        bottom: SizeConfig.blockSizeVertical * 2,
      ),
      child: Text(
        "#" + naziv,
        style: TextStyle(
          fontSize: SizeConfig.safeBlockHorizontal * 3,
          fontWeight: FontWeight.w300,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}

String number = '0000000';

class CallsAndMessagesService {
  void call(String number) => launch("tel:$number");
}
