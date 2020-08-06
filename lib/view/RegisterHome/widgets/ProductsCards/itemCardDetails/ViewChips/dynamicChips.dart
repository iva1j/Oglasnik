import 'dart:async';
import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/viewModel/Chips/renderDynamicChips.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class DynamicChipsWidget extends StatefulWidget {
  const DynamicChipsWidget(
    @required this.dynamicChipPressed,
  );
  @override
  final VoidCallback dynamicChipPressed;
  _DynamicChipsWidgetState createState() => _DynamicChipsWidgetState();
}

class _DynamicChipsWidgetState extends State<DynamicChipsWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    ///Iva i Elvir , sortiranje čipova za odabrane čipove i čipove iz liste,
    ///pomoću sortiranja čipovi se nakon sto su obrisani vrate na svoje prvobitne pozicije u listi
    citysuggestions.sort();
    return renderDynamicChips(context, widget.dynamicChipPressed);
  }
}