import 'package:Oglasnik/utils/specialElements.dart';
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
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: newInputBackButtonIphone(context),
      ),
      body: Page5(bottom: bottom),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: ImagePageWidget(bottom: bottom),
    );
  }
}
