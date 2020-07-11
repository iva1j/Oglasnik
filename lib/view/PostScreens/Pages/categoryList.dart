import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Pages/city.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String dropdownValue = 'Kategorija';

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

class Proizvodjac extends StatefulWidget {
  const Proizvodjac({
    Key key,
  }) : super(key: key);

  @override
  _ProizvodjacState createState() => _ProizvodjacState();
}

class _ProizvodjacState extends State<Proizvodjac> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: this._formKey,
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Text('What is your favorite city?'),
              TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(labelText: 'City'),
                  controller: this._typeAheadController,
                ),
                suggestionsCallback: (pattern) {
                  return CitiesService.getSuggestions(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(title: Text(suggestion));
                },
                onSuggestionSelected: (suggestion) {
                  this._typeAheadController.text = suggestion;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (this._formKey.currentState.validate()) {
                    this._formKey.currentState.save();
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Your Favorite City is ${this._selectedCity}')));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );

    // Column(
    //   children: <Widget>[
    //     Container(
    //       margin: EdgeInsets.only(bottom: 40.0),
    //     ),
    //     Container(
    //       margin: EdgeInsets.symmetric(horizontal: 30.0),
    //       child: TextFormField(
    //         maxLines: null,
    //         keyboardType: TextInputType.multiline,
    //         decoration: const InputDecoration(
    //             labelText: 'Proizvođač', labelStyle: TextStyle()),
    //       ),
    //     ),      ],
    // );
  }
}
