import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/articlePageWidget.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({
    Key key,
    @required this.bottom,
  }) : super(key: key);

  final double bottom;

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
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
        onWillPop: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            registeredGlob = false;
            return RegisteredHome();
          }),
        ),
        child: Scaffold(
          body: SingleChildScrollView(
            reverse: true,
            child: ArticlePageWidget(bottom: widget.bottom),
          ),
        ),
      ),
    );
  }
}
