import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';

class DescriptionPageWidget extends StatefulWidget {
  const DescriptionPageWidget({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  _DescriptionPageWidgetState createState() => _DescriptionPageWidgetState();
}

class _DescriptionPageWidgetState extends State<DescriptionPageWidget> {
  @override
  void initState() {
    productDescController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottom),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 20,
                  left: SizeConfig.blockSizeHorizontal * 10,
                  right: SizeConfig.blockSizeHorizontal * 10,
                  bottom: SizeConfig.blockSizeVertical * 22),
              child: OpisTextField(),
            ),
            PageViewButton(),
          ],
        ),
      ),
    );
  }
}
