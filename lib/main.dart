import 'package:Oglasnik/utils/colors_and_themes/themeData.dart';
import 'package:Oglasnik/utils/lifecycle_manager.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/pages/register.dart';
import 'package:Oglasnik/view/SignInPage/pages/signin.dart';
import 'package:Oglasnik/view/SplashScreen/pages/splash.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewProductViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}

numberOfProductsPerBrandTest(String brandName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('productBrand', isEqualTo: brandName)
      .getDocuments();

  final List<DocumentSnapshot> documents = productsQuery.documents;

  return documents.length;
}

// implementacija ove funkcije blizu kraju
/*
top3BrandsPerCategory(String categoryName) async {
  final QuerySnapshot productsQuery = await Firestore.instance
      .collection('products')
      .where('productCategory', isEqualTo: categoryName)
      .getDocuments();

  final List<DocumentSnapshot> documents = productsQuery.documents;

  final top3 = <DocumentSnapshot, dynamic>{};

  for (final item in documents) {
    var numb = await numberOfProductsPerBrandTest(item["productBrand"]);
    top3[item] = numb;
  }

  documents.sort((a, b) => top3[b].compareTo(top3[a]));

  if (documents.length == 0 || documents.length == 1) return documents;
  int i = 0;
  while (i < documents.length - 1) {
    //if (i + 1 == documents.length) break;
    if (documents[i]["productBrand"] != documents[i + 1]["productBrand"])
      i++;
    else
      documents.removeAt(i + 1);
  }

  if (documents.length < 3) {
    final QuerySnapshot productBrands = await Firestore.instance
        .collection('categoryBrand')
        .where('categoryName', isEqualTo: categoryName)
        .getDocuments();
    final List<DocumentSnapshot> docs = productBrands.documents;
    //...
    while (documents.length < 3) {}
  }

  //return documents.sublist(0, 3);
}
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initCategoryNames();
    initCategoryBrands();
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
