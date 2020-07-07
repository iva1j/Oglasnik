import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/imageUploadPart.dart';
import 'package:flutter/material.dart';

class ImagePriceScreen extends StatefulWidget {
  @override
  _ImagePriceScreenState createState() => _ImagePriceScreenState();
}

class _ImagePriceScreenState extends State<ImagePriceScreen> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: newInputBackButtonIphone(context),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: ImageUploadPart(bottom: bottom),
      ),
    );
  }
}
