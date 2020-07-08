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
