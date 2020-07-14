import 'package:Oglasnik/view/PostScreens/Pages/pageView/subpages/pageFourDescription.dart';
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
