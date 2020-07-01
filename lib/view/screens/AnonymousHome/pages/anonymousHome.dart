import 'package:Oglasnik/view/screens/Auth/pages/RegistrationPage/register.dart';
import 'package:Oglasnik/view/screens/Auth/pages/SignInPage/signin.dart';
import 'package:Oglasnik/view/screens/AnonymousHome/widgets/homeFloatingButton.dart';
import 'package:Oglasnik/viewModel/AuthViewModel.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AnonymouseHome extends StatefulWidget {
  @override
  _AnonymouseHomeState createState() => _AnonymouseHomeState();
}

class _AnonymouseHomeState extends State<AnonymouseHome> {
  //  final FirebaseAuth auth = FirebaseAuth.instance;

  final AnonymousViewModel auth = AnonymousViewModel();

  @override
  void initState() {
    super.initState();
    _handleAnonymousSignIn(); //#TODO odkomentarisati prije DEMO/review
  }

  Future<FirebaseUser> _handleAnonymousSignIn() async {
    dynamic result = await auth.getAnonymous();
    return result;
  }

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
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
    );
  }
}
