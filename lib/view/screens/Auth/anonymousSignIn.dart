import 'package:Oglasnik/viewModel/anonymousViewModel.dart';
import 'package:flutter/material.dart';

class AnonymousSignIn extends StatefulWidget {
  @override
  _AnonymousSignInState createState() => _AnonymousSignInState();
}

class _AnonymousSignInState extends State<AnonymousSignIn> {
  final AnonymousViewModel auth = AnonymousViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Anonymous')),
      body: Center(
        child: FlatButton(
          onPressed: () async {
            dynamic result = await auth.getAnonymous();
            (result == null)
                ? print('errori signing in')
                : print('user signed in');
          },
          child: Text('SignIn Anonymous'),
          
        ),
      ),
    );
  }
}
