import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/mainTitle.dart';
import 'package:Oglasnik/view/PostScreens/pages/categoryPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/cityPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/descriptionPage.dart';
import 'package:Oglasnik/view/PostScreens/pages/imagePage.dart';
import 'package:Oglasnik/view/PostScreens/Widgets/articlePageWidget.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:Oglasnik/viewModel/CreateProduct/createProductViewModel.dart';
import 'package:flutter/material.dart';

PageController pageController = PageController(initialPage: 0);

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: newInputBackButtonIphone(context),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MainTitle(),
            Expanded(
              child: PageView(
                physics: new NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  Container(child: PageOne(bottom: bottom)),
                  Container(child: CategoryPage()),
                  Container(child: CityPage()),
                  Container(child: PageFour(bottom: bottom)),
                  Container(child: PageFive(bottom: bottom)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 140.0),
              child: button("Dalje", () async {
                if (pageController.page == 4) {
                  email = 'nekimail';
                  productName = productNameController.text;
                  productCategory = dropdownValueCategory;
                  productBrand = brandTypeAheadController.text;
                  productLocation = dropdownValueCity;
                  productID = 'adjasdjasp';
                  productTag = productTagController.text;
                  productDesc = productDescController.text;
                  productImg1 = 'adjasdjasp';
                  productImg2 = 'adjasdjasp';
                  productImg3 = 'adjasdjasp';
                  productprice = productPriceController.text;
                  print(email + productName + productTag);
                  CreateProduct().createProduct(
                      context,
                      email,
                      productName,
                      productID,
                      productCategory,
                      productBrand,
                      productLocation,
                      productTag,
                      productDesc,
                      productImg1,
                      productImg2,
                      productImg3,
                      productprice);
                } else {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.ease);
                  productName = productNameController.text;
                  print(productName);

                  print(pageController.toString());
                  print(pageController.page);
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({
    Key key,
    @required this.bottom,
    TextEditingController productNameController,
  }) : super(key: key);

  final double bottom;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return RegisteredHome();
        }),
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: true,
          child: ArticlePageWidget(bottom: bottom),
        ),
      ),
    );
  }
}