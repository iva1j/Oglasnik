import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/PostScreens/pages/articlePage.dart';
import 'package:Oglasnik/view/PostScreens/pages/categoryPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/cityPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/descriptionPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/imagePage.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';

class PageViewPages extends StatelessWidget {
  const PageViewPages({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
    );
  }
}
