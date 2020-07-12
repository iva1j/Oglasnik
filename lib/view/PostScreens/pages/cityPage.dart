import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/cityDropDown.dart';

import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/widgets/custom_dropdown.dart'
    as custom;

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
  Widget build(BuildContext context) {
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
                Container(
                  margin: EdgeInsets.only(bottom: 80.0, top: 15),
                ),
                CityDropDown(),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 40.0),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextFormField(
                        controller: productTagController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                            hintText: 'Oznake',
                            helperText:
                                'Oznake razdvojiti zarezom: Sarajevo, zamjena, Yoda',
                            contentPadding: EdgeInsets.only(left: 15.0)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
