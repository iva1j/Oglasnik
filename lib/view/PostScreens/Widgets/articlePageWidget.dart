import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

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
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: <Widget>[
          MainTitle(),
          Container(
            //evo neki komentar
            margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 20,
                left: SizeConfig.blockSizeHorizontal * 10,
                right: SizeConfig.blockSizeHorizontal * 10,
                bottom: SizeConfig.blockSizeVertical * 20),
            child: NazivTextField(),
          ),
          PageViewButton()
        ],
      ),
    );
  }
}
