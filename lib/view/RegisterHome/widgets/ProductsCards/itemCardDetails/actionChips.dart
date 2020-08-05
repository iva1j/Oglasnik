import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
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
    selectedChips.sort();
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 6),
      child: Row(
        children: List<Widget>.generate(selectedChips.length, (index) {
          return Container(
            margin: EdgeInsets.only(
              right: SizeConfig.blockSizeHorizontal * 2,
            ),
            child: Chip(
              label: Text(
                selectedChips[index],
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.34),
                ),
              ),
              backgroundColor: Color.fromRGBO(226, 11, 48, 0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(14),
              )),
              deleteIconColor: Color.fromRGBO(0, 0, 0, 0.54),
              onDeleted: () {
                widget.actionChipDeleted();
                setState(() {
                  citysuggestions.add(selectedChips[index]);
                  selectedChips.removeAt(index);
                });
              },
            ),
          );
        }),
      ),
    );
  }
}
