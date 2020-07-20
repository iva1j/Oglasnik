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
    //brandTypeAheadController = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // brandTypeAheadController.dispose();
    //productBrandFormKey.currentState.dispose();
    productCategoryDropDownKey.currentState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: WillPopScope(
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
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 10,
                      left: SizeConfig.blockSizeHorizontal * 10,
                      right: SizeConfig.blockSizeHorizontal * 10,
                    ),
                  ),
                  CategoryDropDown(),
                  BrandForm(),
                  PageViewButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
