import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';

/* 
Amer i Fahrudin:
Funkcija sluzi za odredjivanje dimenzija neke slike (na osnovu njenog URL-a koji proslijedimo kao parametar). 
Sluzice za odredjivanje kako ce slika biti fit-ovana u container.

*/

Future<Size> calculateImageDimension(String imgUrl) async {
  Completer<Size> completer = Completer();
  Image image = Image.network(imgUrl);
  await image.image.resolve(ImageConfiguration()).addListener(
    ImageStreamListener(
      (ImageInfo image, bool synchronousCall) {
        var myImage = image.image;
        Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
        completer.complete(size);
      },
    ),
  );
  return completer.future;
}
