import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/descriptionPageWidget.dart';
import 'package:flutter/material.dart';

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
  void initState() {
    pageFourInitControllers();
    super.initState();
  }

  @override
  void dispose() {
    pageFourDisposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: WillPopScope(
          onWillPop: () => Future.sync(onWillPop),
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: SingleChildScrollView(
              reverse: true,
              child: DescriptionPageWidget(bottom: widget.bottom),
            ),
          )),
    );
  }
}
