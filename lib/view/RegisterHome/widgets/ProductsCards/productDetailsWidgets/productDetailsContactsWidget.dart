import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/phoneNumberButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetailsWidgets/phoneNumberWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsContactsWidget extends StatefulWidget {
  final index;
  const ProductDetailsContactsWidget({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  _ProductDetailsContactsWidgetState createState() =>
      _ProductDetailsContactsWidgetState();
}

class _ProductDetailsContactsWidgetState
    extends State<ProductDetailsContactsWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 1,
          bottom: SizeConfig.blockSizeVertical * 16), // ne mijenjati
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
            child: phoneNumberWidget(widget.index),
          ),
          phoneNumberButtonWidget(widget.index),
        ],
      ),
    );
  }
}
