import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/globals.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/internetDialog.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedTextFields.dart/PageViewTextFields/priceTextField.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/imageUploadButtons/imageOneUploadButton.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/imageUploadButtons/imageThreeUploadButton.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/imageUploadButtons/imageTwoUploadButton.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinner.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:Oglasnik/viewModel/ImageUpload/upload.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/checkingInternet.dart';

class ImagePageWidget extends StatefulWidget {
  const ImagePageWidget({
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
  _ImagePageWidgetState createState() => _ImagePageWidgetState();
}

class _ImagePageWidgetState extends State<ImagePageWidget> {
  @override
  initState() {
    super.initState();
  }

  void refresh() {
    setState(() {});
  }

  String _path1, _path2, _path3;
  String _fileName1, _fileName2, _fileName3;
  String _extension1, _extension2, _extension3;

  bool loading = false;

  FileType _imageType = FileType.image;

  //extract
  void openFileExplorer1() async {
    _path1 = await FilePicker.getFilePath(type: _imageType);
    _fileName1 = _path1.split('/').last;
    _extension1 = _fileName1.toString().split('.').last;

    setState(() {
      img1 = _fileName1;
      pathGlobal1 = _path1;
    });
  }

//extract
  void openFileExplorer2() async {
    _path2 = await FilePicker.getFilePath(type: _imageType);
    _fileName2 = _path2.split('/').last;
    _extension2 = _fileName2.toString().split('.').last;
    setState(() {
      img2 = _fileName2;
      pathGlobal2 = _path2;
    });
  }

//extract
  void openFileExplorer3() async {
    _path3 = await FilePicker.getFilePath(type: _imageType);
    _fileName3 = _path3.split('/').last;
    _extension3 = _fileName3.toString().split('.').last;
    setState(() {
      img3 = _fileName3;
      pathGlobal3 = _path3;
    });
  }

//extract
  void deleteFirstEntry() {
    if (createSwitcher) {
      setState(() {
        if (img2 != immutableImg2 && img3 != immutableImg3) {
          img1 = img2;
          img2 = img3;
          img3 = immutableImg3;
        } else if (img2 != immutableImg2) {
          img1 = img2;
          img2 = immutableImg2;
        } else {
          img1 = immutableImg1;
        }
      });
    } else {
      setState(() {
        if ((img2 != immutableImg2 || image2Name != null) &&
            (img3 != immutableImg3 || image3Name != null)) {
          if (img1 != immutableImg1) {
            if (img2 != immutableImg2) {
              /*
              img1 = immutableImg1;
              image1Name = img2;*/

              img1 = img2;
              pathGlobal1 = pathGlobal2;
              productImg1Update = productImg2Update;
            } else {
              image1Name = image2Name;
              productImg1Update = productImg2Update;
            }

            if (img3 != immutableImg3) {
              img2 = img3;
              pathGlobal2 = pathGlobal3;
              img3 = immutableImg3;
              productImg2Update = productImg3Update;
              productImg3Update = null;
            } else {
              image2Name = image3Name;
              image3Name = null;
              productImg2Update = productImg3Update;
              productImg3Update = null;
            }
          } else {
            if (img2 != immutableImg2) {
              img1 = img2;
              pathGlobal1 = pathGlobal2;
              productImg1Update = productImg2Update;
            } else {
              image1Name = image2Name;
              productImg1Update = productImg2Update;
            }

            if (img3 != immutableImg3) {
              img2 = img3;
              pathGlobal2 = pathGlobal3;
              img3 = immutableImg3;
              productImg2Update = productImg3Update;
              productImg3Update = null;
            } else {
              image2Name = image3Name;
              image3Name = null;
              productImg2Update = productImg3Update;
              productImg3Update = null;
            }
          }
        } else if (img2 != immutableImg2 || image2Name != null) {
          if (img2 != immutableImg2) {
            //if (img1 != immutableImg1) {
            img1 = img2;
            img2 = immutableImg2;
            pathGlobal1 = pathGlobal2;
            pathGlobal2 = null;
            productImg1Update = productImg2Update;
            productImg2Update = null;
            /*} else {
              img1 = img2;
              img2 = immutableImg2;
              pathGlobal1 = pathGlobal2;
              pathGlobal2 = null;
              productImg1Update = productImg2Update;
              productImg2Update = null;
            }*/
          } else {
            if (img1 != immutableImg1) {
              img1 = immutableImg1;
              image1Name = image2Name;
              image2Name = null;
              productImg1Update = productImg2Update;
              productImg2Update = null;
            } else {
              image1Name = image2Name;
              image2Name = null;
              productImg1Update = productImg2Update;
              productImg2Update = null;
            }
          }
        } else {
          img1 != immutableImg1 ? img1 = immutableImg1 : image1Name = null;
          productImg1Update = null;
        }
      });
    }
  }

//extract
  void deleteSecondEntry() {
    if (createSwitcher) {
      setState(() {
        if (img3 != immutableImg3) {
          img2 = img3;
          img3 = immutableImg3;
        } else {
          img2 = immutableImg2;
        }
      });
    } else {
      setState(() {
        if (img3 != immutableImg3 || image3Name != null) {
          if (img3 != immutableImg3) {
            //if (img2 != immutableImg2) {
            img2 = img3;
            pathGlobal2 = pathGlobal3;
            pathGlobal3 = null;
            img3 = immutableImg3;
            productImg2Update = productImg3Update;
            productImg3Update = null;
            /*} else {
              img2 = img3;
              pathGlobal2 = pathGlobal3;
              pathGlobal3 = null;
              img3 = immutableImg3;
              productImg2Update = productImg3Update;
              productImg3Update = null;
            }*/
          } else {
            if (img2 != immutableImg2) {
              img2 = immutableImg2;
              image2Name = image3Name;
              image3Name = null;
              productImg2Update = productImg3Update;
              productImg3Update = null;
            } else {
              image2Name = image3Name;
              image3Name = null;
              productImg2Update = productImg3Update;
              productImg3Update = null;
            }
          }
        } else {
          img2 != immutableImg2 ? img2 = immutableImg2 : image2Name = null;
          productImg2Update = null;
        }
      });
    }
  }

//extract
  void deleteThirdEntry() {
    if (createSwitcher) {
      setState(() {
        img3 = immutableImg3;
      });
    } else {
      setState(() {
        if (img3 != immutableImg3) {
          img3 = immutableImg3;
          productImg3Update = null;
        } else {
          image3Name = null;
          productImg3Update = null;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /*
    print('Image1Name ' + image1Name);
    print('Image2Name ' + image2Name);
    print('Image3Name ' + image3Name);*/
    SizeConfig().init(context);
    return loading ? Loading() : imageUploadContainer(context);
  }

  Container imageUploadContainer(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          MainTitle(
            editProduct: widget.editProduct,
          ),
          Container(
            margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 18),
          ),
          imageOneUploadButton(openFileExplorer1, deleteFirstEntry),
          imageTwoUploadButton(openFileExplorer2, deleteSecondEntry),
          imageThreeUploadButton(openFileExplorer3, deleteThirdEntry),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 3,
                      bottom: SizeConfig.blockSizeVertical * 3),
                  child: priceTextField()),
              Padding(
                padding: EdgeInsets.only(left: 7, bottom: 5),
                child: Text(
                  MoneyText().kmText,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 6,
          ),
          Container(
            child: pageViewSubmitButton(context),
          ),
        ],
      ),
    );
  }

//extract !Fahrudin = Faruk
  SizedBox pageViewSubmitButton(BuildContext context) {
    if (!createSwitcher) {
      return button("Završi", () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        await InternetConnectivity().checkForConnectivity();
        print(
            "value of hasActiveConnection: " + hasActiveConnection.toString());
        if (hasActiveConnection == true) {
          if (pageController.page == 4) {
            if (productPriceFormKey.currentState.validate()) {
              widget.onFlatButtonPressed();

              setState(() => loading = true);
              createdGlob = true;
              azurload = true;
              if (img1 != immutableImg1)
                await upload(img1, pathGlobal1, 1)
                    .then((value) => productImg1Update = value);
              if (img2 != immutableImg2)
                await upload(img2, pathGlobal2, 2)
                    .then((value) => productImg2Update = value);
              if (img3 != immutableImg3)
                await upload(img3, pathGlobal3, 3)
                    .then((value) => productImg3Update = value);

              productName = updateProductNameReturn == null
                  ? updateProductName
                  : updateProductNameReturn;
              productCategory = updateDropdownValueCategory;
              productBrand = updateDropdownValueBrand;
              productLocation = updateDropdownValueCity;
              productTag = updateProductTagsReturn == null
                  ? updateProductTags
                  : updateProductTagsReturn;
              productDesc = updateProductDescriptionReturn == null
                  ? updateProductDescription
                  : updateProductDescriptionReturn;
              productprice = updateProductPriceReturn == null
                  ? updateProductPrice
                  : updateProductPriceReturn;

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
                /*
                productImg1 == null
                    ? widget.productSnapshot.productImg1
                    : productImg1,
                productImg2 == null
                    ? widget.productSnapshot.productImg2
                    : productImg2,
                productImg3 == null
                    ? widget.productSnapshot.productImg3
                    : productImg3,*/
                productprice,
              );
              img1 = immutableImg1;
              img2 = immutableImg2;
              img3 = immutableImg3;
              productImg1 = null;
              productImg2 = null;
              productImg3 = null;
              pathGlobal1 = null;
              pathGlobal2 = null;
              pathGlobal3 = null;
              productImg1Update = null;
              productImg2Update = null;
              productImg3Update = null;
              print('status interneta:' + productIsOnline.toString());
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => RegisteredHome()));
            } else
              return null;
          }
        } else
          displayInternetDialog(context);
      });
    } else {
      return button("Završi", () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        await InternetConnectivity().checkForConnectivity();

        if (hasActiveConnection) {
          if (pageController.page == 4) {
            if (productPriceFormKey.currentState.validate()) {
              widget.onFlatButtonPressed();

              setState(() => loading = true);
              createdGlob = true;
              if (img1 != immutableImg1)
                await upload(img1, pathGlobal1, 1)
                    .then((value) => productImg1 = value);
              if (img2 != immutableImg2)
                await upload(img2, pathGlobal2, 2)
                    .then((value) => productImg2 = value);
              if (img3 != immutableImg3)
                await upload(img3, pathGlobal3, 3)
                    .then((value) => productImg3 = value);

              productName = newProductNameReturn;
              productCategory = dropdownValueCategory;
              productBrand = dropdownValueBrand;
              productLocation = dropdownValueCity;
              productTag = newProductTagsReturn;
              productDesc = newProductDescriptionReturn;
              productprice = newProductPriceReturn;

              print(email + productName + productTag);
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
              createSwitcher = false;

              img1 = immutableImg1;
              img2 = immutableImg2;
              img3 = immutableImg3;
              productImg1 = null;
              productImg2 = null;
              productImg3 = null;
              pathGlobal1 = null;
              pathGlobal2 = null;
              pathGlobal3 = null;
              print('status interneta:' + productIsOnline.toString());

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => RegisteredHome()));
            } else
              return null;
          }
        } else
          displayInternetDialog(context);
      });
    }
  }

//extract
  Future uploadImageAndPrintName() async {
    if (img1 != immutableImg1)
      await upload(img1, pathGlobal1, 1).then((value) => productImg1 = value);
    if (img2 != immutableImg2)
      await upload(img2, pathGlobal2, 2).then((value) => productImg2 = value);
    if (img3 != immutableImg3)
      await upload(img3, pathGlobal3, 3).then((value) => productImg3 = value);
  }
}
