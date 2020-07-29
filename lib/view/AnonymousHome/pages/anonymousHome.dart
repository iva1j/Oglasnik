import 'package:Oglasnik/view/AnonymousHome/pages/mainbody.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/bottomSheet.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

class AnonymousHome extends StatefulWidget {
  @override
  _AnonymousHomeState createState() => _AnonymousHomeState();
}

class _AnonymousHomeState extends State<AnonymousHome> {
  @override
  void initState() {
    super.initState();
    //_handleAnonymousSignIn();
  }

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: AppBarTheme.of(context).color,
          centerTitle: true,
          title: Text('Oglasnik'),
          leading: Container(),
        ),
        body: MainBody(),
        floatingActionButton: email != null
            ? mainFloatingButton(email)
            : homeFloatingAnimatedButton(),
        bottomSheet: BottomSheetContainer(),
      ),
    );
  }
}
