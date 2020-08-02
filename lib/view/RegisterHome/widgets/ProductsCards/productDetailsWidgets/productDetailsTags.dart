import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/itemCardWidgets/oglasTag.dart';

import 'package:flutter/material.dart';

import 'package:Oglasnik/utils/shared/globalVariables.dart';

SingleChildScrollView productDetailsTagsWidget(int index) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 1,
      ),
      child: Row(
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
  );
}