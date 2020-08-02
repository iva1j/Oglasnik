import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: Container(
        // height: SizeConfig.blockSizeVertical * 100 - 200,
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 35),
              ),
              Container(
                width: 350,
                padding:
                    EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 4),
                child: Text(
                  'Kreiranje artikla...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: mainAppColor,
                      fontSize: SizeConfig.safeBlockVertical * 3),
                ),
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
