import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/Pages/city.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String dropdownValue = 'Kategorija';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: newInputBackButtonIphone(context),
      ),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 40.0, top: 15),
              child: MainTitle()),
          Container(
            height: SizeConfig.screenHeight,
            margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: Card(
              elevation: 16,
              child: Container(
                margin: EdgeInsets.only(left: 10.0),
                width: SizeConfig.screenWidth,
                child: Container(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    isExpanded: true,
                    underline: Container(),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Kategorija',
                      'Kategorija 2',
                      'Kategorija 3'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 80.0),
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
                            pageBuilder: (context, animation1, animation2) =>
                                City()));
                  })),
            ],
          )
        ],
      ),
    );
  }
}
