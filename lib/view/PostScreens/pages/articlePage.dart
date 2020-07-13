import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/widgets/articlePageWidget.dart';
import 'package:Oglasnik/view/PostScreens/widgets/pageViewPages.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
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
      body: PageViewPages(bottom: bottom),
    );
  }
}

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
      onWillPop: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return RegisteredHome();
        }),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: ArticlePageWidget(bottom: bottom),
        ),
      ),
    );
  }
}
