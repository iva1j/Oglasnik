import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: Container(
        // height: SizeConfig.blockSizeVertical * 100 - 200,
        color: Colors.white,
        child: Center(
          child: Column(
            //ovaj dio koda je radio  : Amer
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 40),
              ),
              Container(
                width: 350,
              ),
              SpinKitCircle(
                color: mainAppColor,
                size: 80.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
