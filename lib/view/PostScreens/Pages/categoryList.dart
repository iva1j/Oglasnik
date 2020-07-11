import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/Pages/city.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/Pages/custom_dropdown.dart' as custom;

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String dropdownValue = 'Kategorija1';

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: newInputBackButtonIphone(context),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottom),
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(bottom: 80.0, top: 15),
                  child: MainTitle()),
              Container(
                height: SizeConfig.screenHeight,
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: Card(
                    elevation: 16,
                    child: Container(
                        //width: MediaQuery.of(context).size.width * 0.3,
                        margin: const EdgeInsets.only(left: 2.0, right: 2.0),

                        //left: MediaQuery.of(context).size.width * 0.75),
                        //padding: EdgeInsets.only(),
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
                                  onChanged: (String newValue) =>
                                      setState(() => dropdownValue = newValue),
                                  items: <String>[
                                    'Kategorija1',
                                    'Kategorija2',
                                    'Kategorija3',
                                    'Kategorija4',
                                    'Kategorija5',
                                    'Kategorija6',
                                    'Kategorija7',
                                    'Kategorija8',
                                    'Kategorija9',
                                    'Kategorija10',
                                    'Kategorija11',
                                    'Kategorija12',
                                    'Kategorija13'
                                  ].map<custom.DropdownMenuItem<String>>(
                                      (String value) {
                                    return custom.DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ))))),
              ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 40.0),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                          labelText: 'Proizvođač',
                          labelStyle: TextStyle(
                              //color: myFocusNode.hasFocus ? Colors.grey : Colors.black
                              )),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 100.0),
                      child: button('Dalje', () async {
                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        City()));
                      })),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
