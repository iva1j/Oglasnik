import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/pages/articlePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:Oglasnik/view/PostScreens/widgets/custom_dropdown.dart'
    as custom;

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

//TextEditingController brandTypeAheadController;

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    brandTypeAheadController = new TextEditingController();
    super.initState();
  }

  String dropdownValue = 'Kategorija1';

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   leading: newInputBackButtonIphone(context),
        // ),
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
                Container(
                  height: SizeConfig.screenHeight,
                  margin:
                      EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
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
                                    onChanged: (String productCategoryList) =>
                                        setState(() => dropdownValue =
                                            productCategoryList),
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
                Form(
                  key: brandFormKey,
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
                            controller: brandTypeAheadController,
                          ),
                          suggestionsCallback: (pattern) {
                            return Proizvodjac.getSuggestions(pattern);
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(title: Text(suggestion));
                          },
                          onSuggestionSelected: (suggestion) {
                            brandTypeAheadController.text = suggestion;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
