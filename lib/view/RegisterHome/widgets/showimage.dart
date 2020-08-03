import 'package:Oglasnik/viewModel/PreviewProduct/imageSizeCalculator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'dart:io';
import 'package:zoom_widget/zoom_widget.dart';
import 'package:photo_view/photo_view.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/services.dart';

class PrikazSlika extends StatelessWidget {
  final List<dynamic> listaSlika;
  PrikazSlika({this.listaSlika});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CarouselSlider(
                height: height,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                initialPage: 0,
                items: listaSlika.map((imgUrl) {
                  /* 
                  Amer i Fahrudin:
                  Racunamo dimenzije trenutne slike pomocu definisane funkcije (calculateImageDimension), smjestamo ih 
                  u lokalne varijable te na osnovu toga odredjuemo sta ce primiti fit property Image.asset/network-a.
                  Container koji sadrzi sliku je wrappan PhotoView widgetom koji omogucava zoom njegovog child widgeta
                  i njegovi property-i minScale i maxScale odredjuju koliko se moze zoomat u oba smjera. U slucaju
                  da je slika portret, onda cemo je renderat preko cijelog ekrana, a ako je landscape tipa, onda 
                  je razvucemo po sirini.
                  
                  */
                  var imgHeight;
                  var imgWidth;
                  calculateImageDimension(imgUrl).then((value) {
                    imgHeight = value.height;
                    imgWidth = value.width;
                  });
                  return Builder(
                    builder: (BuildContext context) {
                      return PhotoView.customChild(
                        minScale: PhotoViewComputedScale.contained * 1.0,
                        maxScale: PhotoViewComputedScale.covered * 2.0,
                        child: Container(
                          child: imgUrl == "assets/images/nophoto.jpg"
                              ? Image.asset(
                                  "assets/images/nophoto.jpg",
                                  fit: BoxFit.fitWidth,
                                )
                              : imgHeight > imgWidth
                                  ? Image.network(
                                      imgUrl,
                                      fit: BoxFit.fill,
                                      height: height,
                                    )
                                  : Image.network(
                                      imgUrl,
                                      fit: BoxFit.fitWidth,
                                      height: height,
                                    ),
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
