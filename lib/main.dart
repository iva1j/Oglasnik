import 'package:Oglasnik/view/screens/AnonymousHome/anonymousHome.dart';
import 'package:Oglasnik/view/screens/RegisterHome/registeredUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation
        .landscapeLeft, //#TODO before demo, disable landscape rotation (both sides)
    DeviceOrientation.landscapeRight
  ]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.green,
          buttonTheme: ButtonThemeData(
            height: 48,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(
                  //   color: Color.fromRGBO(149, 152, 154, 100),
                  ),
            ),
            //highlightColor: Color.fromRGBO(0, 0, 0, 24),
            highlightColor: Colors.green,
          ),
          appBarTheme: AppBarTheme(
            color: Color.fromARGB(255, 226, 11, 48),
            elevation: 0.0,
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          textTheme: ThemeData.light()
              .textTheme
              .copyWith(headline6: TextStyle(fontFamily: 'Roboto'))),
      home: AnonymouseHome(),
      //home: AnonymouseHome(),
    );
  }
}
