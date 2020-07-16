import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/subpages/pageFiveImagePrice.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/subpages/pageFourDescription.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/subpages/pageOne.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/subpages/pageThreeCityPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/subpages/pageTwoCategoryPage.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';

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
          //PageViewButton(),
        ],
      ),
    );
  }
}
