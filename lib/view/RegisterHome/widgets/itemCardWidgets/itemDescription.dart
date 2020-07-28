import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  final String description;
  const ItemDescription({
    Key key,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        // top: SizeConfig.blockSizeVertical * 1,
        // bottom: SizeConfig.blockSizeVertical,
        left: SizeConfig.blockSizeHorizontal * 3,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          description,
          style: TextStyle(color: descOfItem, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
