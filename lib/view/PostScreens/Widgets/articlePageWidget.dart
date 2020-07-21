import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/nazivTextField.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';

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
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: <Widget>[
          MainTitle(),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 20,
          ),
          Container(
            margin: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 10,
              right: SizeConfig.blockSizeHorizontal * 10,
            ),
            child: NazivTextField(),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 20,
          ),
          PageViewButton(),
        ],
      ),
    );
  }
}
