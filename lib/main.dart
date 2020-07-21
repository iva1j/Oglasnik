import 'package:Oglasnik/utils/lifecycle_manager.dart';
import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';

import 'package:Oglasnik/view/PostScreens/Widgets/categoryDropDown.dart';

import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productBrandCard.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/view/SignInPage/pages/signin.dart';
import 'package:Oglasnik/view/SplashScreen/pages/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productBrandCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';

import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:Oglasnik/viewModel/PreviewProduct/previewProduct.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}

void initCategoryNames() async {
  final QuerySnapshot categoryQuery =
      await Firestore.instance.collection('category').getDocuments();

  final List<DocumentSnapshot> documents = categoryQuery.documents;

  documents.forEach((element) {
    categoryNames.add(element["categoryName"]);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initCategoryNames();
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
          home: Splash(),
          routes: {
            "/back": (_) => AnonymousHome(),
            "/homeregister": (_) => RegisteredHome(),
            "/register": (_) => RegisterPage(),
            "/signin": (_) => SigninPage(),
          },
        ),
      ),
    );
  }
}
