import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/pages/categoryPage.dart';
import 'package:Oglasnik/view/PostScreens/widgets/mainTitle.dart';
import 'package:flutter/material.dart';

class ArticlePageWidget extends StatelessWidget {
  const ArticlePageWidget({
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
                margin: EdgeInsets.only(bottom: 120.0), child: MainTitle()),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Naziv artikla',
                    contentPadding: EdgeInsets.only(left: 15.0)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 217.5),
              child: button('Dalje', () async {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            CategoryPage()));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
