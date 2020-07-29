import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/itemImage.dart';
import 'package:flutter/material.dart';

ItemImage itemCardImage(AsyncSnapshot snapshot, int index) {
  return ItemImage(
      img: (snapshot.data.documents[index]['productImg1'] != null)
          ? snapshot.data.documents[index]['productImg1']
          : (snapshot.data.documents[index]['productImg2'] != null)
              ? snapshot.data.documents[index]['productImg2']
              : (snapshot.data.documents[index]['productImg3'] != null)
                  ? snapshot.data.documents[index]['productImg3']
                  : "");
}
