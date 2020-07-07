import 'package:Oglasnik/view/PostScreens/Pages/image_price_upload.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';

class Describe extends StatefulWidget {
  @override
  _DescribeState createState() => _DescribeState();
}

class _DescribeState extends State<Describe> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: newInputBackButtonIphone(context),
        ),
        body: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: Container(
            height: SizeConfig.screenHeight,
            margin: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 80.0), child: MainTitle()),
                TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: 'Opis',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  child: button('Dalje', () async {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                ImagePriceScreen()));
                  }),
                ),
              ],
            ),
          ),
        ));
  }
}
