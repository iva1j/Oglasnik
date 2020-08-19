import 'package:Oglasnik/utils/margins.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/oglasTag.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

Container productDetailsTagsWidget(int index) {
  return Container(
    width: SizeConfig.blockSizeHorizontal * 75,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: Margin().symmetric(0, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: products[index]
              .productTag
              .split(',')
              .map<Widget>(
                (element) => element.trim().length > 0
                    ? new OglasTag(naziv: element)
                    : Container(),
              )
              .toList(),
        ),
      ),
    ),
  );
}
