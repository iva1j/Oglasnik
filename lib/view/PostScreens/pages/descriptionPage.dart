import 'package:Oglasnik/view/PostScreens/pages/cityPage.dart';
import 'package:Oglasnik/view/PostScreens/widgets/descriptionPageWidget.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/specialElements.dart';

class DescribePage extends StatefulWidget {
  @override
  _DescribePageState createState() => _DescribePageState();
}

class _DescribePageState extends State<DescribePage> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return WillPopScope(
      onWillPop: () =>
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return CityPage();
      })),
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: newInputBackButtonIphone(context),
          ),
          body: PageFour(bottom: bottom)),
    );
  }
}

class PageFour extends StatelessWidget {
  const PageFour({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: DescriptionPageWidget(bottom: bottom),
    );
  }
}
