import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/Pages/categoryList.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:flutter/material.dart';

class ArticalName extends StatelessWidget {
  const ArticalName({
    Key key,
  }) : super(key: key);

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
                      margin: EdgeInsets.only(bottom: 80.0),
                      child: MainTitle()),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Naziv artikla',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 217.5),

                    child: button('Dalje', () async {
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  Category()));
                    }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}