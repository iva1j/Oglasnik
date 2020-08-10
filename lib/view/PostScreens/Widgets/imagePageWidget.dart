import 'package:Oglasnik/utils/checkForInternetConnection.dart';
import 'package:Oglasnik/utils/globals.dart';
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
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:random_string/random_string.dart';

class ImagePageWidget extends StatefulWidget {
  const ImagePageWidget({
    Key key,
    @required this.bottom,
    @required this.onFlatButtonPressed,
  }) : super(key: key);

  final double bottom;
  final VoidCallback onFlatButtonPressed;

  @override
  _ImagePageWidgetState createState() => _ImagePageWidgetState();
}

class _ImagePageWidgetState extends State<ImagePageWidget> {
  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  initState() {
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
    super.initState();
  }

  // void dispose() {
  //   _connectivity.disposeStream();
  //   super.dispose();
  // }

  String _path1, _path2, _path3;
  String _extension1, _extension2, _extension3;
  String _fileName1, _fileName2, _fileName3;

  //final VoidCallback;

  bool loading = false;

  FileType _imageType = FileType.image;

  List<StorageUploadTask> _tasks = <StorageUploadTask>[];

  void openFileExplorer1() async {
    //_path1 = null;

    _path1 = await FilePicker.getFilePath(type: _imageType);
    _fileName1 = _path1.split('/').last;
    _extension1 = _fileName1.toString().split('.').last;

    setState(() {
      img1 = _fileName1;
      pathGlobal1 = _path1;
      buttonOne = true;
    });
  }

  void openFileExplorer2() async {
    _path2 = await FilePicker.getFilePath(type: _imageType);
    _fileName2 = _path2.split('/').last;
    _extension2 = _fileName2.toString().split('.').last;
    setState(() {
      img2 = _fileName2;
      pathGlobal2 = _path2;
      buttonTwo = true;
    });
    //upload(_fileName2, _path2, 2).then((value) => productImg2 = value);
  }

  void openFileExplorer3() async {
    _path3 = await FilePicker.getFilePath(type: _imageType);
    _fileName3 = _path3.split('/').last;
    _extension3 = _fileName3.toString().split('.').last;
    setState(() {
      img3 = _fileName3;
      pathGlobal3 = _path3;
    });
    //upload(_fileName3, _path3, 3).then((value) => productImg3 = value);
  }

  @override
  Widget build(BuildContext context) {
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.none:
        productIsOnline = false;
        string = "Offline";
        break;
      case ConnectivityResult.mobile:
        productIsOnline = true;
        string = "Mobile: Online";
        break;
      case ConnectivityResult.wifi:
        productIsOnline = true;
        string = "WiFi: Online";
    }
    SizeConfig().init(context);
    return loading ? Loading() : imageUploadContainer(context);
  }

  Container imageUploadContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          MainTitle(),
          Container(
            margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 18),
          ),
          imageOneUploadButton(openFileExplorer1),
          imageTwoUploadButton(openFileExplorer2),
          imageThreeUploadButton(openFileExplorer3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 35.0, bottom: 30.0),
                  child: priceTextField()),
              Padding(
                padding: EdgeInsets.only(left: 7, bottom: 5),
                child: Text(
                  MoneyText().kmText,
                ),
              ),
            ],
          ),
          /*
          Container(
            child: PageViewButton(),
          )*/
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

//nije moguće refaktorisati zbog privatnih varijabli. Check it out
  SizedBox pageViewSubmitButton(BuildContext context) {
    return button("Završi", () async {
      FocusScope.of(context).requestFocus(new FocusNode());
      // if (productIsOnline != false) {
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
          //showIphoneButton = false;

          productName = productNameController.text;
          productCategory = dropdownValueCategory;
          productBrand = dropdownValueBrand;
          productLocation = dropdownValueCity;
          productTag = productTagController.text;
          productDesc = productDescController.text;
          productprice = productPriceController.text;

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
      // } else
      // displayInternetDialog(context);
    });
  }
}
