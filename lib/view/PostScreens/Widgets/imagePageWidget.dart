import 'dart:async';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:random_string/random_string.dart';

class ImagePageWidget extends StatefulWidget {
  const ImagePageWidget({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  _ImagePageWidgetState createState() => _ImagePageWidgetState();
}

class _ImagePageWidgetState extends State<ImagePageWidget> {
  String _path1, _path2, _path3;
  String _extension1, _extension2, _extension3;
  String _fileName1, _fileName2, _fileName3;

  FileType _imageType = FileType.image;

  List<StorageUploadTask> _tasks = <StorageUploadTask>[];

  void openFileExplorer1() async {
    //_path1 = null;
    _path1 = await FilePicker.getFilePath(type: _imageType);
    _fileName1 = _path1.split('/').last;
    _extension1 = _fileName1.toString().split('.').last;

    setState(() {
      img1 = _fileName1;
    });
  }

  void openFileExplorer2() async {
    _path2 = await FilePicker.getFilePath(type: _imageType);
    _fileName2 = _path2.split('/').last;
    _extension2 = _fileName2.toString().split('.').last;
    setState(() {
      img2 = _fileName2;
    });
  }

  void openFileExplorer3() async {
    _path3 = await FilePicker.getFilePath(type: _imageType);
    _fileName3 = _path3.split('/').last;
    _extension3 = _fileName3.toString().split('.').last;
    setState(() {
      img3 = _fileName3;
    });
  }

  upload(fileName, filePath, id) async {
    StorageReference storageRef =
        await FirebaseStorage.instance.ref().child('images').child(fileName);
    await storageRef.putFile(
      File(filePath),
    );
    Timer(Duration(seconds: 5), () async {
      final String url = await storageRef.getDownloadURL();

      await setState(() {
        if (id == 1) productImg1 = url;
        if (id == 2) productImg2 = url;
        if (id == 3) productImg3 = url;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      //padding: EdgeInsets.only(bottom: widget.bottom),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            MainTitle(),
            Container(
              margin:
                  EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 18),
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
            Container(
              margin: EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 5),
              child: pageViewSubmitButton(context),
            ),
          ],
        ),
      ),
    );
  }

//nije moguće refaktorisati zbog privatnih varijabli. Check it out
  SizedBox pageViewSubmitButton(BuildContext context) {
    return button("Završi", () async {
      FocusScope.of(context).requestFocus(new FocusNode());
      if (pageController.page == 4) {
        if (productPriceFormKey.currentState.validate()) {
          if (img1 == _fileName1) await upload(_fileName1, _path1, 1);
          if (img2 == _fileName2) await upload(_fileName2, _path2, 2);
          if (img3 == _fileName3) await upload(_fileName3, _path3, 3);
          productName = productNameController.text;
          productCategory = dropdownValueCategory;
          productBrand = brandTypeAheadController.text;
          productLocation = dropdownValueCity;
          productTag = productTagController.text;
          productDesc = productDescController.text;
          productprice = productPriceController.text;
          print(email + productName + productTag);
          Timer(Duration(seconds: 7), () {
            CreateProduct().createProduct(
              context,
              email,
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
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => RegisteredHome()));
          });
        } else
          return null;
      } //validation if statement

      // else {
      //   pageController.nextPage(
      //       duration: Duration(milliseconds: 800),
      //       curve: Curves.ease);
      //   productName = productNameController.text;
      //   print(productName);
      //   print(pageController.toString());
      //   print(pageController.page);
      // }
    });
  }
}
