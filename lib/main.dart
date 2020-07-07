import 'package:Oglasnik/utils/lifecycle_manager.dart';
import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/PasswordChange/pages/passwordChange.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/view/SignInPage/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LifeCycleManager(
    child: GestureDetector(
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
        theme: buildThemeData(),
        home: SigninPage(),
        routes: {
          "/back": (_) => AnonymouseHome(),
          "/homeregister": (_) => RegisteredHome(),
          "/register": (_) => RegisterPage(),
          "/signin": (_) => SigninPage(),
        },
      ),
    )
    );
  }
}
