import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/imagePageWidget.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

class PageFive extends StatefulWidget {
  const PageFive({
    Key key,
    @required this.bottom,
    @required this.onFlatButtonPressed,
    @required this.editProduct,
    @required this.productSnapshot,
  }) : super(key: key);

  final double bottom;
  final VoidCallback onFlatButtonPressed;
  final String editProduct;
  final Product productSnapshot;
  @override
  _PageFiveState createState() => _PageFiveState();
}

class _PageFiveState extends State<PageFive> {
  @override
  Widget build(BuildContext context) {
    if (!createSwitcher) {
      print("Name");
      print(updateProductNameReturn == null
          ? updateProductName
          : updateProductNameReturn);
      print("Category");
      print(updateDropdownValueCategory);
      print("Brand");
      print(updateDropdownValueBrand);
      print("City");
      print(updateDropdownValueCity);
      print("Tags");
      print(updateProductTagsReturn == null
          ? updateProductTags
          : updateProductTagsReturn);
      print("Description");
      print(updateProductDescriptionReturn == null
          ? updateProductDescription
          : updateProductDescriptionReturn);
    } else {
      print("Name");
      print(newProductNameReturn);
      print("Category");
      print(dropdownValueCategory);
      print("Brand");
      print(dropdownValueBrand);
      print("City");
      print(dropdownValueCity);
      print("Tags");
      print(newProductTagsReturn);
      print("Description");
      print(newProductDescriptionReturn);
    }

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: WillPopScope(
        onWillPop: () => Future.sync(onWillPop),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            reverse: true,
            child: ImagePageWidget(
              bottom: widget.bottom,
              editProduct: widget.editProduct,
              productSnapshot: widget.productSnapshot,
              onFlatButtonPressed: widget.onFlatButtonPressed,
            ),
          ),
        ),
      ),
    );
  }
}
