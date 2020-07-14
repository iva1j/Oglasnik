import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/brandForm.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/categoryDropDown.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    brandTypeAheadController = new TextEditingController();
    super.initState();
  }

// @override
//   void deactivate() {
//     brandTypeAheadController.dispose();
//     super.deactivate();
//   }

  @override
  void dispose() {
    brandTypeAheadController.dispose();
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
                Container(
                  //#TODO za Farisa i Elvira
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 10,
                    left: SizeConfig.blockSizeHorizontal * 10,
                    right: SizeConfig.blockSizeHorizontal * 10,
                    //bottom: SizeConfig.blockSizeVertical * 20
                  ),
                ),
                CategoryDropDown(),
                BrandForm(),
                //   PageViewButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
