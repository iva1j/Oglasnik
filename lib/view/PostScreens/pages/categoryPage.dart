import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/pages/articlePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String dropdownValue = 'Kategorija';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return WillPopScope(
      onWillPop: () =>
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return ArticlePage();
      })),
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
                    child: MainTitle()),
                Container(
                  height: SizeConfig.screenHeight,
                  margin:
                      EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
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
                Form(
                  key: this._formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50.0),
                        child: TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                            maxLength: 18,
                            decoration: InputDecoration(
                                hintText: 'Proizvođač',
                                contentPadding: EdgeInsets.only(left: 15.0)),
                            controller: this._typeAheadController,
                          ),
                          suggestionsCallback: (pattern) {
                            return Proizvodjac.getSuggestions(pattern);
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(title: Text(suggestion));
                          },
                          onSuggestionSelected: (suggestion) {
                            this._typeAheadController.text = suggestion;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 150.0),
                //   child: button('Dalje', () async {
                //     Navigator.pushReplacement(
                //         context,
                //         PageRouteBuilder(
                //             pageBuilder: (context, animation1, animation2) =>
                //                 CityPage()));
                //   }),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
