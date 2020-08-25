import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:Oglasnik/viewModel/ImageUpload/initValuesOnProductCreated.dart';
import 'package:Oglasnik/viewModel/ImageUpload/resetGlobalVariables.dart';
import 'package:Oglasnik/viewModel/ImageUpload/uploadImageAndPrintName.dart';
import 'package:flutter/cupertino.dart';
import 'package:random_string/random_string.dart';

Future createProductPressed(BuildContext context) async {
  uploadImageAndPrintName();
  initValuesOnProductCreated();
  await CreateProduct().createProduct(
    context,
    email,
    phoneNumber,
    productName,
    productID = randomAlphaNumeric(20),
    productCategory,
    productBrand,
    productLocation,
    productTag,
    productDesc,
    productImg1,
    productImg2,
    productImg3,
    productprice,
  );
  myProductList.add(productID);
  createSwitcher = false;

  resetGlobalVariables();

  Navigator.of(context).pushAndRemoveUntil(
      FadeRoute(page: RegisteredHome()), (Route<dynamic> route) => false);
}
