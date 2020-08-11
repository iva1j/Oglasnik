import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:flutter/material.dart';

renderActionChips(actionChipDeleted, context) {
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
                color: textActionChip,
              ),
            ),
            backgroundColor: backgroundActionChip,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(14),
            )),

            /// Fahrudin i Elvir, brisanje chipova kada ne zelimo vise taj chip u nasem filteru
            /// Funkcija brise chipove iz rowa i vraca ga u prvobitno stanje
            deleteIconColor: colorDelete,
            onDeleted: () {
              citysuggestions.add(selectedChips[index]);
              selectedChips.removeAt(index);
              actionChipDeleted();
            },
          ),
        );
      }),
    ),
  );
}
