/*import 'package:flutter/material.dart';

class ActionChip extends StatefulWidget {
  @override
  _ActionChipState createState() => _ActionChipState();
}

class _ActionChipState extends State<ActionChip> {
  @override
  Widget build(BuildContext context) {
    selectedChips.sort();
    return Container(
      
    );
  }
}


actionChips(Function actionChipDeleted) {
      //selectedChips.add("LOL");
      //selectedChips.clear();
      
      return Row(
          children: List<Widget>.generate(selectedChips.length, (index) {
        return Container(
          margin: EdgeInsets.only(
            left: SizeConfig.blockSizeHorizontal * 2,
            right: SizeConfig.blockSizeHorizontal * 2,
          ),
          child: Chip(
              label: Text(selectedChips[index]),
              backgroundColor: Colors.red,
              onDeleted: () {
                actionChipDeleted(index);
              }),
        );
      }));
    }*/
