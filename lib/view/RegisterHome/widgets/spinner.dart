import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical * 100,
      color: Colors.white,
      child: Center(
        child: SpinKitWave(
          color: mainAppColor,
          size: 40.0,
        ),
      ),
    );
  }
}
