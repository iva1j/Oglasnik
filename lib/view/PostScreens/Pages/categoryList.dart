import 'package:Oglasnik/utils/specialElements.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String dropdownValue = 'Kategorije';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 80.0),
          Container(
            height: 55, //gives the height of the dropdown button
            width: 400,
            child: Card(
              elevation: 16,
              //  margin: EdgeInsets.zero,
              margin: EdgeInsets.only(left: 20.0),
              child: Container(
                margin: EdgeInsets.only(left: 20.0),
                width: 550,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  isExpanded: true,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Kategorije', 'Automobili', 'Motori']
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
          Column(
            children: <Widget>[
              Container(margin: EdgeInsets.only(bottom: 80.0)),
              TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    labelText: 'Proizvođač',
                    labelStyle: TextStyle(
                        //color: myFocusNode.hasFocus ? Colors.grey : Colors.black
                        )),
              ),
              Container(
                  margin: EdgeInsets.only(top: 100.0),
                  child: button('Dalje', () async {})),
            ],
          )
        ],
      ),
    );
  }
}
