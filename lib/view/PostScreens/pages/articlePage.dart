import 'package:Oglasnik/utils/shared/globalVariables.dart';
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
    productNameController = new TextEditingController();
    productTagController = new TextEditingController();
    productDescController = new TextEditingController();
    productPriceController = new TextEditingController();
    brandTypeAheadController = new TextEditingController();
    super.initState();
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
