import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
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

              //extract onTap metod
              onTap: () {
                newProductNameReturn = null;
                newProductTagsReturn = null;
                newProductDescriptionReturn = null;
                newProductPriceReturn = null;
                image1Name = null;
                image2Name = null;
                image3Name = null;
                img1 = immutableImg1;
                img2 = immutableImg2;
                img3 = immutableImg3;
                createSwitcher = true;
                azurload = false;
                print("Create switcher je sada: ");
                print(createSwitcher);
                Navigator.of(context).pushReplacement(FadeRoute(
                    page: ArticlePage(
                  editProduct: UserProducts().newProduct,
                  productSnapshot: null,
                  productID: null,
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
