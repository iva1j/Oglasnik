import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/subpages/pageFiveImagePrice.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/subpages/pageFourDescription.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/subpages/pageOne.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/subpages/pageThreeCityPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/subpages/pageTwoCategoryPage.dart';

import 'package:flutter/material.dart';

class PageViewPages extends StatefulWidget {
  const PageViewPages({
    Key key,
    @required this.bottom,
    @required this.onFlatButtonPressed,
  }) : super(key: key);

  final double bottom;
  final VoidCallback onFlatButtonPressed;

  @override
  _PageViewPagesState createState() => _PageViewPagesState();
}

class _PageViewPagesState extends State<PageViewPages> {
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
                Container(child: PageOne(bottom: widget.bottom)),
                Container(child: CategoryPage()),
                Container(child: CityPage()),
                Container(child: PageFour(bottom: widget.bottom)),
                Container(
                    child: PageFive(
                  bottom: widget.bottom,
                  onFlatButtonPressed: widget.onFlatButtonPressed,
                )),
              ],
            ),
          ),
          //PageViewButton(),
        ],
      ),
    );
  }
}
