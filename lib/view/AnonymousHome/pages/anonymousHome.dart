import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';
import 'package:Oglasnik/viewModel/Auth/authViewModel.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/colorThemes.dart';

class AnonymousHome extends StatefulWidget {
  @override
  _AnonymousHomeState createState() => _AnonymousHomeState();
}

class _AnonymousHomeState extends State<AnonymousHome> {
  final AnonymousViewModel auth = AnonymousViewModel();

  @override
  void initState() {
    super.initState();
    //_handleAnonymousSignIn();
  }

  Future<FirebaseUser> _handleAnonymousSignIn() async {
    dynamic result = await auth.getAnonymous();
    return result;
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
          //backgroundColor: mainAppColor,
          //backgroundColor: Color.fromARGB(255, 0, 11, 48),
          centerTitle: true,
          title: Text('Oglasnik'),
        ),
        body: Container(color: Colors.white),
        floatingActionButton: homeFloatingAnimatedButton(),
        bottomSheet: Container(
          height: 55,
          width: double.infinity,
          color: Color.fromARGB(255, 226, 11, 48),
        ),
      ),
    );
  }
}
