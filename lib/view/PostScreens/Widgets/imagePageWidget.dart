import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';

import 'package:flutter/material.dart';

class ImagePageWidget extends StatelessWidget {
  const ImagePageWidget({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: Container(
        height: SizeConfig.screenHeight,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: 80.0), child: MainTitle()),
            imageOneUploadButton(() {}), //dodati funkcije
            imageTwoUploadButton(() {}),
            imageThreeUploadButton(() {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 35.0),
                    child: priceTextField()),
                Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(MoneyText().kmText)),
              ],
            ),

            Container(
                margin: EdgeInsets.only(top: 100.0),
                child: button('Završi', () async {})),
          ],
        ),
      ),
    );
  }
}
