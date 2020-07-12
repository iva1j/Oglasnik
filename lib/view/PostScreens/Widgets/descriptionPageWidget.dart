import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class DescriptionPageWidget extends StatelessWidget {
  const DescriptionPageWidget({
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
            // Container(
            //     margin: EdgeInsets.only(bottom: 80.0), child: MainTitle()),
            Container(
              //dodati ovaj dio
              margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 90),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    labelText: 'Opis',
                    contentPadding: EdgeInsets.only(left: 15.0)),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 198.0), //kraj dijela

            //   child: button('Dalje', () async {
            //     Navigator.pushReplacement(
            //         context,
            //         PageRouteBuilder(
            //             pageBuilder: (context, animation1, animation2) =>
            //                 ImagePage()));
            //   }),
            // ),
          ],
        ),
      ),
    );
  }
}
