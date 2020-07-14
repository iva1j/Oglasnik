import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/cityDropDown.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/tagsForm.dart';
import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  void initState() {
    productTagController = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    productTagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Column(
              children: <Widget>[
                MainTitle(),
                // Container(
                //   margin: EdgeInsets.only(
                //     //bottom: 80.0,
                //     top: SizeConfig.blockSizeVertical * 6,
                //   ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 12,
                    left: SizeConfig.blockSizeHorizontal * 10,
                    right: SizeConfig.blockSizeHorizontal * 10,
                    //bottom: SizeConfig.blockSizeVertical * 20
                  ),
                  color: Colors.red,
                ),
                CityDropDown(),
                TagsForm(),
                PageViewButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
