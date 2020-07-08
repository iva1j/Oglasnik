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
        body: SingleChildScrollView(
          reverse: true,
                  child: Padding(

            padding: EdgeInsets.only(bottom: bottom),
            child: Container(
              height: SizeConfig.screenHeight,
              margin: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 80.0), child: MainTitle()),
                  Container(                                                //dodati ovaj dio
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        labelText: 'Opis',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 198.0),                    //kraj dijela

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
          ),
        ));
  }
}
