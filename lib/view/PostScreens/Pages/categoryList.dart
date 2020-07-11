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
    final bottom= MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: newInputBackButtonIphone(context),
      ),
      body: SingleChildScrollView(
        reverse:true,
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
                          'Kategorija 3',
                          'Kategorija 4',
                          'Kategorija 5',
                          'Kategorija 6',
                          'Kategorija 7',
                          'Kategorija 8',
                          'Kategorija 9',
                          'Kategorija 0',
                          'Kategorija 11',
                          'Kategorija 32',
                          'Kategorija 33',
                          'Kategorija 42',
                          'Kategorija 321',
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
              Proizvodjac()
            ],
          ),
        ),
      ),
    );
  }
}

List<String> suggestionsList = [
    "Apple",
    "Armidillo",
    "Actual",
    "Actuary",
    "America",
    "Argentina",
    "Australia",
    "Antarctica",
    "Blueberry",
    "Cheese",
    "Danish",
    "Eclair",
    "Fudge",
    "Granola",
    "Hazelnut",
    "Ice Cream",
    "Jely",
    "Kiwi Fruit",
    "Lamb",
    "Macadamia",
    "Nachos",
    "Oatmeal",
    "Palm Oil",
    "Quail",
    "Rabbit",
    "Salad",
    "T-Bone Steak",
    "Urid Dal",
    "Vanilla",
    "Waffles",
    "Yam",
    "Zest"
  ];


class Proizvodjac extends StatelessWidget {
  const Proizvodjac({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
       
        // Container(
        //     margin: EdgeInsets.only(top: 100.0),
        //     child: button('Dalje', () async {
        //       Navigator.pushReplacement(
        //           context,
        //           PageRouteBuilder(
        //               pageBuilder: (context, animation1, animation2) =>
        //                   City()));
        //     })),
      
      ],
    );
  }
}
