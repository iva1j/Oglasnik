import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/Pages/describe.dart';
import 'package:Oglasnik/view/PostScreens/Pages/image_price_upload.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:flutter/material.dart';

class City extends StatefulWidget {
  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  String dropdownValue = 'Sarajevo';
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
              Container(margin: EdgeInsets.only(bottom: 80.0, top:15), child: MainTitle()),
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
                        onTap: (){dropdownValue = 'Sarajevo';},
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Sarajevo', 'Beograd', 'Zagreb','Moskva', 'Berlin', 'Pariz', 'London', 'Lisabon', 'Amsterdam', 'LA', 'Madrid', 'Barcelona', 'Tokyo', 'Peking']
                            .map<DropdownMenuItem<String>>((String value) {
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
                    margin: EdgeInsets.only(bottom: 40.0),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                          labelText: 'Oznake',
                          labelStyle: TextStyle(
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
                                    Describe()));
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
