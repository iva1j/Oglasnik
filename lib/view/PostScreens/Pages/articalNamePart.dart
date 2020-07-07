import 'package:Oglasnik/view/PostScreens/Pages/categoryList.dart';
import 'package:Oglasnik/view/PostScreens/Pages/city.dart';
import 'package:Oglasnik/view/PostScreens/Pages/describe.dart';
import 'package:Oglasnik/view/PostScreens/Pages/image_price_upload.dart';
import 'package:Oglasnik/view/PostScreens/Pages/articalName.dart';
import 'package:flutter/material.dart';

ScrollController c;

class ArticalNamePart extends StatefulWidget {
  @override
  _ArticalNamePartState createState() => _ArticalNamePartState();
}

class _ArticalNamePartState extends State<ArticalNamePart> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    c = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: new NeverScrollableScrollPhysics(),
      controller: _controller,
    );
  }
}
