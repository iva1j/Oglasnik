import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';

import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/widgets/custom_dropdown.dart'
    as custom;

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  String dropdownValue = 'Sarajevo';
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   leading: newInputBackButtonIphone(context),
        // ),

        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 80.0, top: 15),
                ),
                Container(
                  height: SizeConfig.screenHeight,
                  margin: EdgeInsets.symmetric(horizontal: 35.0),
                  child: Card(
                    elevation: 16,
                    child: Container(
                        margin: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Center(
                            child: Align(
                                alignment: Alignment.topRight,
                                child: custom.DropdownButton<String>(
                                  value: dropdownValue,
                                  height: MediaQuery.of(context).size.height /
                                      2.229,
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  isExpanded: true,
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    height: 1.5,
                                  ),
                                  underline: Container(),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Sarajevo',
                                    'London',
                                    'Lisabon',
                                    'Berlin',
                                    'New York',
                                    'Beč',
                                    'Madrid',
                                    'Rim',
                                    'Bukurešt',
                                    'Moskva',
                                    'Kopenhagen',
                                    'Basel',
                                    'Pariz'
                                  ].map<custom.DropdownMenuItem<String>>(
                                      (String value) {
                                    return custom.DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                )))),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 40.0),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 35.0),
                      child: TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                            hintText: 'Oznake',
                            helperText:
                                'Oznake razdvojiti zarezom: Sarajevo, zamjena, Yoda',
                            contentPadding: EdgeInsets.only(left: 15.0)),
                      ),
                    ),
                    // Container(
                    //     margin: EdgeInsets.only(top: 100.0),
                    //     child: button('Dalje', () async {
                    //       Navigator.pushReplacement(
                    //           context,
                    //           PageRouteBuilder(
                    //               pageBuilder:
                    //                   (context, animation1, animation2) =>
                    //                       DescribePage()));
                    //     })),
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
