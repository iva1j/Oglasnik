import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/articlePageWidget.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({
    Key key,
    @required this.bottom,
    TextEditingController productNameController,
  }) : super(key: key);

  final double bottom;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: ArticlePageWidget(bottom: bottom),
        ),
      ),
    );
  }
}
