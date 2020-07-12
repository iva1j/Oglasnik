import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/pages/categoryPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/cityPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/descriptionPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/imagePage.dart';
import 'package:Oglasnik/view/PostScreens/widgets/articlePageWidget.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  PageController pageController = PageController(initialPage: 0);

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
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                physics: new NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  Container(child: PageOne(bottom: bottom)),
                  Container(child: CategoryPage()),
                  Container(child: CityPage()),
                  Container(child: PageFour(bottom: bottom)),
                  Container(child: PageFive(bottom: bottom)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 140.0),
              child: button('Dalje', () async {
                pageController.nextPage(
                    duration: Duration(milliseconds: 800), curve: Curves.ease);
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) {
              return RegisteredHome();
            })),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
            reverse: true,
            child: ArticlePageWidget(bottom: bottom),
          ),
        ));
  }
}
