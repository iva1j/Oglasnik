import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              NewPostScreen().unosNaslov,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: SizeConfig.safeBlockHorizontal * 5,
                fontWeight: FontWeight.w500,
              ),
            ),
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
