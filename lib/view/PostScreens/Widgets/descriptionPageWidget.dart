import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/opisTextField.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
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
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      //padding: EdgeInsets.only(bottom: widget.bottom),
      child: Container(
        //margin: EdgeInsets.all(15),
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
              child: OpisTextField(),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 20,
            ),
            PageViewButton(),
          ],
        ),
      ),
    );
  }
}
