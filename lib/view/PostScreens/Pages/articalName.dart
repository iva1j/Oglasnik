import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/Pages/categoryList.dart';
import 'package:Oglasnik/view/PostScreens/Pages/image_price_upload.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:flutter/material.dart';

class ArticalName extends StatefulWidget {
  const ArticalName({
    Key key,
  }) : super(key: key);

  @override
  _ArticalNameState createState() => _ArticalNameState();
}

class _ArticalNameState extends State<ArticalName> {
  int pageIndex = 0;
  PageController _pageViewController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context)
        .viewInsets
        .bottom; //#TODO kreirati kao globalnu varijablu
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: newInputBackButtonIphone(context),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageViewController,
              onPageChanged: (int index) {
                setState(() {
                  pageIndex = index;
                });
              },
              children: <Widget>[
                Page1(bottom: bottom),
                Page5(bottom: bottom),
                Proizvodjac(),
              ],
            ),
          ),
          FlatButton(
            onPressed: () {
              _pageViewController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.elasticOut);
            },
            child: Text('Idemo dalje :) '),
          ),
        ]),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 10,
                    right: SizeConfig.blockSizeHorizontal * 10),
                child: TextFormField(
                  maxLength: 28,
                  decoration: const InputDecoration(
                      hintText: 'Naziv artikla', hintMaxLines: 26),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100.0),
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
    );
  }
}
