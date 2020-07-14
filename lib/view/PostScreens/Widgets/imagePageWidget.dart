import 'dart:async';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/pageViewButton.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  //SharedPreferences prefs = await SharedPreferences.getInstance();

  FileType _imageType = FileType.image;

  List<StorageUploadTask> _tasks = <StorageUploadTask>[];

  void openFileExplorer1() async {
    //_path1 = null;
    _path1 = await FilePicker.getFilePath(type: _imageType);
    _fileName1 = _path1.split('/').last;
    _extension1 = _fileName1.toString().split('.').last;
    //img1 = _fileName1;
    setState(() {
      img1 = _fileName1;
    });
  }

  void openFileExplorer2() async {
    //_path1 = null;
    _path2 = await FilePicker.getFilePath(type: _imageType);
    _fileName2 = _path2.split('/').last;
    _extension2 = _fileName2.toString().split('.').last;
    //img1 = _fileName1;
    setState(() {
      img2 = _fileName2;
    });
  }

  void openFileExplorer3() async {
    //_path1 = null;
    _path3 = await FilePicker.getFilePath(type: _imageType);
    _fileName3 = _path3.split('/').last;
    _extension3 = _fileName3.toString().split('.').last;
    //img1 = _fileName1;
    setState(() {
      img3 = _fileName3;
    });
  }

/*
  uploadToFirebase() {
    String fileName = _path.split('/').last;
    print(fileName);
    //  if (!mounted) return;
    setState(() {
      if (buttonOne == true) {
        img1 = fileName;
        buttonOne = false;
      } else if (buttonTwo == true) {
        img2 = fileName;
        buttonTwo = false;
      } else if (buttonThree == true) {
        img3 = fileName;
        buttonThree = false;
      }
    });
    String filePath = _path;
    upload(fileName, filePath);
  }
*/
  upload(fileName, filePath, id) async {
    StorageReference storageRef =
        await FirebaseStorage.instance.ref().child('images').child(fileName);
    await storageRef.putFile(
      File(filePath),
      /*
      StorageMetadata(
        contentType: '$_imageType/$_extension1',
      ),*/
    );
    Timer(Duration(seconds: 5), () async {
      final String url = await storageRef.getDownloadURL();
      //   if (!mounted) return;
      setState(() {
        if (id == 1) productImg1 = url;
        if (id == 2) productImg2 = url;
        if (id == 3) productImg3 = url;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    /*
    final List<Widget> children = <Widget>[];
    _tasks.forEach((StorageUploadTask task) {
      final Widget tile = UploadTaskListTile(
        task: task,
        onDismissed: () => setState(() => _tasks.remove(task)),
      );
      children.add(tile);
    });*/
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottom),
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 22),
            ),

            imageOneUploadButton(openFileExplorer1),
            //dodati funkcije
            imageTwoUploadButton(openFileExplorer2),
            imageThreeUploadButton(openFileExplorer3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 35.0, bottom: 30.0),
                    child: priceTextField()),
                Padding(
                    padding: EdgeInsets.only(left: 7),
                    child: Text(MoneyText().kmText)),
              ],
            ),
            /*
            Container(
              child: PageViewButton(),
            )*/
            Container(
              margin: EdgeInsets.only(bottom: 140.0),
              child: button("Dalje", () async {
                if (pageController.page == 4) {
                  if (img1 == _fileName1) upload(_fileName1, _path1, 1);
                  if (img2 == _fileName2) upload(_fileName2, _path2, 2);
                  if (img3 == _fileName3) upload(_fileName3, _path3, 3);
                  //email = "minutLjubavi";
                  productName = productNameController.text;
                  productCategory = dropdownValueCategory;
                  productBrand = brandTypeAheadController.text;
                  productLocation = dropdownValueCity;
                  productTag = productTagController.text;
                  productDesc = productDescController.text;
                  //productImg1;
                  //productImg2;
                  //productImg3;

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
                        productprice);
                  });
                } else {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.ease);
                  productName = productNameController.text;
                  print(productName);

                  print(pageController.toString());
                  print(pageController.page);
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
/*
class UploadTaskListTile extends StatelessWidget {
  const UploadTaskListTile({Key key, this.task, this.onDismissed})
      : super(key: key);

  final StorageUploadTask task;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StorageTaskEvent>(
      stream: task.events,
      builder: (BuildContext context,
          AsyncSnapshot<StorageTaskEvent> asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          final StorageTaskEvent event = asyncSnapshot.data;
          final StorageTaskSnapshot snapshot = event.snapshot;
        }
        return Dismissible(
          key: Key(task.hashCode.toString()),
          onDismissed: (_) => onDismissed(),
          child: ListTile(
            title: Text('Imagehashcode #${task.hashCode}'),
          ),
        );
      },
    );
  }
}
*/
