import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatefulWidget {
  const ItemImage({
    Key key,
    @required this.img,
  }) : super(key: key);

  final String img;

  @override
  _ItemImageState createState() => _ItemImageState();
}

class _ItemImageState extends State<ItemImage> {
  @override
  Widget build(BuildContext context) {
    return
        //CategoryLoading();
        Container(
      margin: Margin().only(1, 0, 1, 0),
      height: SizeConfig.blockSizeVertical * 20,
      width: SizeConfig.blockSizeVertical * 20,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: widget.img == ""
                ? AssetImage(noPhoto)
                : NetworkImage(widget.img)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.redAccent,
      ),
    );
  }
}
