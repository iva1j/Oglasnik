import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/nazivTextField.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

class ArticlePageWidget extends StatefulWidget {
  const ArticlePageWidget({
    Key key,
    @required this.bottom,
    @required this.editProduct,
    @required this.productSnapshot,
  }) : super(key: key);

  final double bottom;
  final Product productSnapshot;
  final String editProduct;
  @override
  _ArticlePageWidgetState createState() => _ArticlePageWidgetState();
}

String imageName(String imgURL) {
  return imgURL.substring(82, imgURL.indexOf('?alt=media'));
}

class _ArticlePageWidgetState extends State<ArticlePageWidget> {
  @override
  Widget build(BuildContext context) {
    print("AGSAGAGSG");
    print(createSwitcher);
    if (!createSwitcher) {
      updateDropdownValueCategory = widget.productSnapshot.productCategory;
      updateDropdownValueBrand = widget.productSnapshot.productBrand;
      updateDropdownValueCity = widget.productSnapshot.productLocation;
      productTag = productTagController.text;
      
      
      if (widget.productSnapshot.productImg1 != null)
        image1Name = imageName(widget.productSnapshot.productImg1);
      if (widget.productSnapshot.productImg2 != null)
        image2Name = imageName(widget.productSnapshot.productImg2);
      if (widget.productSnapshot.productImg3 != null)
        image3Name = imageName(widget.productSnapshot.productImg3);
      print(updateDropdownValueCategory);
      print(updateDropdownValueBrand);
      print(updateDropdownValueCity);
      //  print(imageName(widget.productSnapshot.productImg1));
      //print(widget.productSnapshot.productImg1.indexOf("2F"));
    }

    SizeConfig().init(context);
    return Container(
      child: Column(
        children: <Widget>[
          // MainTitle(
          //   editProduct: widget.editProduct,
          // ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 20,
          ),
          Container(
            margin: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 10,
              right: SizeConfig.blockSizeHorizontal * 10,
            ),
            child: NazivTextField(
              productSnapshot: widget.productSnapshot,
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 25,
          ),
          PageViewButton(),
        ],
      ),
    );
  }
}
