import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

class PrikazSlika extends StatelessWidget {
  final List<String> listaSlika;
  PrikazSlika({this.listaSlika});
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
                viewportFraction: 0.95,
                initialPage: 0,
                items: listaSlika.map((imgUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: imgUrl == null
                            ? Image.asset("assets/images/nophoto.jpg")
                            : Image.network(
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
