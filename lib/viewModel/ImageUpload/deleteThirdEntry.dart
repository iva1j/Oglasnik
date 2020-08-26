import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:flutter/cupertino.dart';

deleteThirdEntry() {
  if (createSwitcher) {
    img3 = immutableImg3;
  } else {
    if (img3 != immutableImg3) {
      img3 = immutableImg3;
      productImg3Update = null;
    } else {
      image3Name = null;
      productImg3Update = null;
    }
  }
}
