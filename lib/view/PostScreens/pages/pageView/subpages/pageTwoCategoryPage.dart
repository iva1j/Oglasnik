import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/brandForm.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/categoryDropDown.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

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
                /*
                Container(
                  //#TODO za Farisa i Elvira
                  margin: EdgeInsets.only(bottom: 80.0, top: 15),
                ),*/
                CategoryDropDown(),
                BrandForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
