import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/material.dart';

class NoviOglasButton extends StatelessWidget {
  const NoviOglasButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 2,
          bottom: SizeConfig.blockSizeVertical * 1),
      child: SizedBox.fromSize(
        size: Size(80, 80), // button width and height
        child: ClipOval(
          child: Material(
            color: Colors.transparent, // button color
            child: InkWell(
              splashColor: Colors.transparent, // splash color

              //extract onTap metod  Iva
              onTap: () {
                noviOglasButton(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add_circle_outline), // icon
                  Text("Novi oglas"),
                  // text
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
