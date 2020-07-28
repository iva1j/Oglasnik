import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/backButtonsIphone/newbackButtonIphone.dart';
import 'package:Oglasnik/view/PostScreens/pages/pageView/mainPageView.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  bool load = false;
  @override
  void initState() {
    pageViewInitControllers();
    dropDownInitialValueState();
    super.initState();
  }

  finishButtonPressed() {
    setState(() => load = true);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: load
            ? Container(height: 0, width: 0)
            : newInputBackButtonIphone(context),
      ),
      body: PageViewPages(
        bottom: bottom,
        onFlatButtonPressed: finishButtonPressed,
      ),
    );
  }
}
