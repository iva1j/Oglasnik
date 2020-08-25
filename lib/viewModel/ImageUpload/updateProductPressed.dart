import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:Oglasnik/viewModel/ImageUpload/initValuesOnProductUpdated.dart';
import 'package:Oglasnik/viewModel/ImageUpload/resetGlobalVariables.dart';
import 'package:Oglasnik/viewModel/ImageUpload/uploadImageAndPrintName.dart';
import 'package:flutter/cupertino.dart';

Future updateProductPressed(BuildContext context) async {
  uploadImageAndPrintName();
  initValuesOnProductUpdated();

  await CreateProduct().updateProduct(
    context,
    email,
    phoneNumber,
    productName,
    productID = oldProductID,
    productCategory,
    productBrand,
    productLocation,
    productTag,
    productDesc,
    productImg1Update,
    productImg2Update,
    productImg3Update,
    productprice,
  );
  resetGlobalVariables();
  Navigator.of(context).pushAndRemoveUntil(
      FadeRoute(page: RegisteredHome()), (Route<dynamic> route) => false);
}
