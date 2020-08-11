import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/Chips/renderActionChips.dart';
import 'package:flutter/material.dart';

class ActionChipsWidget extends StatefulWidget {
  const ActionChipsWidget(
    @required this.actionChipDeleted,
  );
  @override
  final VoidCallback actionChipDeleted;
  _ActionChipsWidgetState createState() => _ActionChipsWidgetState();
}

class _ActionChipsWidgetState extends State<ActionChipsWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    ///Iva i Elvir , sortiranje čipova za odabrane čipove i čipove iz liste,
    ///pomoću sortiranja čipovi se nakon sto su obrisani vrate na svoje prvobitne pozicije u listi
    selectedChips.sort();
    return renderActionChips(widget.actionChipDeleted, context);
  }
}
