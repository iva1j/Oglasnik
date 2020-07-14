import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';

class ArticlePageWidget extends StatefulWidget {
  const ArticlePageWidget({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  _ArticlePageWidgetState createState() => _ArticlePageWidgetState();
}

class _ArticlePageWidgetState extends State<ArticlePageWidget> {
  @override
  void initState() {
    productNameController = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    productNameController.dispose();
    productNameFormKey.currentState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 140),
            child: NazivTextField(),
          ),
          PageViewButton(),
        ],
      ),
    );
  }
}