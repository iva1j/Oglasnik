import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/pages/descriptionPage.dart';
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
      onWillPop: () =>
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return DescribePage();
      })),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: newInputBackButtonIphone(context),
        ),
        body: PageFive(bottom: bottom),
      ),
    );
  }
}

class PageFive extends StatelessWidget {
  const PageFive({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return DescribePage();
      })),
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0.0,
        //   leading: newInputBackButtonIphone(context),
        // ),
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          reverse: true,
          child: ImagePageWidget(bottom: bottom),
        ),
      ),
    );
  }
}
