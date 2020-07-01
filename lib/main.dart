import 'package:Oglasnik/interface/authToggle.dart';
import 'package:Oglasnik/view/screens/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:Oglasnik/view/screens/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/screens/Auth/pages/RegistrationPage/register.dart';
import 'package:Oglasnik/view/screens/Auth/pages/SignInPage/signin.dart';
import 'package:Oglasnik/view/screens/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]).then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (context) => AuthService(),
        ),
      ],
      child: new MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
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
      child: MaterialApp(
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
        routes: {
          "/back": (_) => AnonymouseHome(),
          "/homeregister": (_) => RegisteredHome(),
          "/register": (_) => RegisterPage(),
          "/signin": (_) => SigninPage(),
        },
      ),
    );
  }
}
