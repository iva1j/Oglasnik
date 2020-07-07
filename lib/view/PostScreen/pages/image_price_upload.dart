import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreen/widgets/mainTitle.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/material.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: backButtonIphone(context),
      ),
      body: WillPopScope(
        onWillPop: () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) {
          return RegisteredHome();
        })),
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Container(
              height: SizeConfig.screenHeight,
              margin: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 80.0),
                      child: MainTitle()),
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
          ),
        ),
      ),
    );
  }
}
