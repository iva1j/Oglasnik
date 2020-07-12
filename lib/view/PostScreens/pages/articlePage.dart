import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/pages/categoryPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/cityPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/descriptionPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/imagePage.dart';
import 'package:Oglasnik/view/PostScreens/widgets/articlePageWidget.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/material.dart';

PageController pageController = PageController(initialPage: 0);

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    // print(pageController.offset.toString() +
    //     '<---->' +
    //     pageController.page.toString());
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MainTitle(),
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
              child: button(
                  // pageController.offset == null || pageController.offset <= 1439
                  //     ? next
                  //     : lastPage,
                  "Dalje", () async {
                (pageController.offset == 1440.0)
                    ? Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => AnonymousHome()))
                    : pageController.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.ease);
                print(pageController.toString());
                print(pageController.page);
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
      onWillPop: () =>
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return RegisteredHome();
      })),
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   leading: newInputBackButtonIphone(context),
        // ),
        // resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          reverse: true,
          child: ArticlePageWidget(bottom: bottom),
        ),
      ),
    );
  }
}

//  appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         leading: newInputBackButtonIphone(context),
//       ),
