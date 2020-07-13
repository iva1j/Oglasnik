import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/pages/descriptionPage.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/imagePageWidget.dart';
import 'package:Oglasnik/view/PostScreens/widgets/imagePageWidget.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: PageFive(bottom: bottom),
      ),
    );
  }
}

class PageFive extends StatefulWidget {
  const PageFive({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  _PageFiveState createState() => _PageFiveState();
}

class _PageFiveState extends State<PageFive> {
  @override
  void initState() {
    productPriceController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          reverse: true,
          child: ImagePageWidget(bottom: widget.bottom),
        ),
      ),
    );
  }
}
