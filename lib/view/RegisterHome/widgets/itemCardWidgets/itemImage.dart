import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key key,
    @required this.img,
  }) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 1,
        right: SizeConfig.blockSizeHorizontal * 1,
      ),
      height: SizeConfig.blockSizeVertical * 20,
      width: SizeConfig.blockSizeVertical * 20,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: img == "" ? AssetImage(noPhoto) : NetworkImage(img)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.redAccent,
      ),
    );
  }
}
