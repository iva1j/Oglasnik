import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/articalName.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/imageUploadPart.dart';
// import 'package:Oglasnik/utils/text_form_fields.dart';
// import 'package:Oglasnik/view/PostScreen/widgets/imageUploadPart.dart';
// import 'package:Oglasnik/view/PostScreen/widgets/mainTitle.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/articalName.dart';

class ArticalNamePart extends StatefulWidget {
  @override
  _ArticalNamePartState createState() => _ArticalNamePartState();
}

class _ArticalNamePartState extends State<ArticalNamePart> {
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
        child: ArticalName(bottom: bottom),
      ),
    );
  }
}
