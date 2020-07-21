import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/backButtonsIphone/backButtonIphone.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/backButtonsIphone/newbackButtonIphone.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/mainPageView.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    pageController = new PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: newInputBackButtonIphone(context),
      ),
      body: PageViewPages(bottom: bottom),
    );
  }
}
