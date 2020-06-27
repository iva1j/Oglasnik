import 'package:Oglasnik/view/screens/AnonymousHome/anonymousHome.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
          primaryColor: Color.fromARGB(255, 226, 11, 48),
          buttonTheme: ButtonThemeData(
            height: 48,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: Color.fromARGB(255, 226, 11, 48),
                style: BorderStyle.solid,
              ),
            ),
            // highlightColor: Colors.green,
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
    );
  }
}
