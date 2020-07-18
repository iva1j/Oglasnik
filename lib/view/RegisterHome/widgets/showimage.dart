import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

class PrikazSlika extends StatelessWidget {
  final Data data;
  PrikazSlika({this.data});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CarouselSlider(
                viewportFraction: 1,
                initialPage: 0,
                items: data.imagesPass.map((imgUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: Image.asset(
                          imgUrl,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
