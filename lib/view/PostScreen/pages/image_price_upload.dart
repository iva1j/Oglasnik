import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/text_form_fields.dart';
import 'package:Oglasnik/view/PostScreen/widgets/imageUploadPart.dart';
import 'package:Oglasnik/view/PostScreen/widgets/mainTitle.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/material.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
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
