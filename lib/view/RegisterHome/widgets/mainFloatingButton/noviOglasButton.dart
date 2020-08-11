import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/PostScreens/pages/articlePage.dart';
import 'package:flutter/material.dart';

class NoviOglasButton extends StatelessWidget {
  const NoviOglasButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox.fromSize(
        size: Size(80, 80), // button width and height
        child: ClipOval(
          child: Material(
            color: Colors.transparent, // button color
            child: InkWell(
              splashColor: Colors.transparent, // splash color
              onTap: () {
                newProductNameReturn = null;
                newProductTagsReturn = null;
                newProductDescriptionReturn = null;
                newProductPriceReturn = null;
                createSwitcher = true;
                azurload = false;
                print("Create switcher je sada: ");
                print(createSwitcher);
                Navigator.of(context).pushReplacement(FadeRoute(
                    page: ArticlePage(
                  editProduct: UserProducts().newProduct,
                  productSnapshot: null,
                  //productID: null,
                )));
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
