import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/widgets/descriptionPageWidget.dart';
import 'package:flutter/material.dart';

class DescribePage extends StatefulWidget {
  @override
  _DescribePageState createState() => _DescribePageState();
}

class _DescribePageState extends State<DescribePage> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
        resizeToAvoidBottomPadding: false, body: PageFour(bottom: bottom));
  }
}

class PageFour extends StatefulWidget {
  const PageFour({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  _PageFourState createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.sync(onWillPop),
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
            reverse: true,
            child: DescriptionPageWidget(bottom: widget.bottom),
          ),
        ));
  }
}
