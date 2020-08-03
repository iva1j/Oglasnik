import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/oglasTag.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

SingleChildScrollView itemCardTags(DocumentSnapshot snapshot) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: snapshot['productTag']
          .split(',')
          //.removeWhere((item) => item.length == 0)
          //.remove("")
          .map<Widget>(
            (element) => element.trim().length > 0
                ? new OglasTag(naziv: element)
                : Container(),
          )
          .toList(),
    ),
  );
}
