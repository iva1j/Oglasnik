import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const spinkit = SpinKitWave(
  color: mainAppColor,
  size: 30.0,
);

class SpinnerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: spinkit,
      ),
    );
  }
}
