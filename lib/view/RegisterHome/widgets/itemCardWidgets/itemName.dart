import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class ItemName extends StatelessWidget {
  final String name;
  const ItemName({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 2,
        bottom: SizeConfig.blockSizeVertical,
        left: SizeConfig.blockSizeHorizontal * 3,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          name,
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 6,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
