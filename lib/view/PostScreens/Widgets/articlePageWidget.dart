import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/material.dart';

class ArticlePageWidget extends StatefulWidget {
  const ArticlePageWidget({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  _ArticlePageWidgetState createState() => _ArticlePageWidgetState();
}

class _ArticlePageWidgetState extends State<ArticlePageWidget> {
  @override
  void initState() {
    productNameController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        
        child: Column(
          children: <Widget>[
            Container(
              
              margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 140),
              child: TextFormField(
                controller: productNameController,
                maxLength: 28,
                decoration: const InputDecoration(
                    hintText: 'Naziv artikla',
                    contentPadding: EdgeInsets.only(left: 15.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
