/*import 'package:Oglasnik/utils/colorThemes.dart';
import 'showimage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  static List<String> imagesList = [
    "assets/img1.jpg",
    "assets/img2.jpg",
    "assets/img3.jpg",
    "assets/img4.jpg",
  ];
  final data = Data(imagesPass: imagesList);
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: SizeConfig.blockSizeVertical * 30,
          width: SizeConfig.blockSizeHorizontal * 80,
          decoration: BoxDecoration(
              border: Border.all(color: alertDialogBorderColor),
              borderRadius: BorderRadius.all(Radius.circular(7))),
          child: Container(
            child: CarouselSlider(
              initialPage: 0,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: imagesList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      child: GestureDetector(
                        child: Image.asset(
                          imgUrl,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PrikazSlika(data: data)));
                        },
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
*/
