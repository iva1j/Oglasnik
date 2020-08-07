import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
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
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 6),
      child: Row(
        children: List<Widget>.generate(citysuggestions.length, (int index) {
          return Container(
            margin: EdgeInsets.only(
              right: SizeConfig.blockSizeHorizontal * 2,
            ),
            child: ActionChip(
              label: Text(
                citysuggestions[index],
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.54),
                ),
              ),
              backgroundColor: Color.fromRGBO(153, 153, 153, 0.2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(14),
              )),

              /// Ovaj dio koda radili : Iva i Amer
              /// na onPressed , uzimamo element iz liste citysuggestions i dodajemo ga u listu selectedChips, na taj
              /// način pratimo koliko je user izabrao gradova.
              onPressed: () {
                if (selectedChips.length < 3) {
                  /*
                  setState(() {
                    selectedChips.add(citysuggestions[index]);
                    citysuggestions.removeAt(index);
                    widget.dynamicChipPressed();
                  });*/
                  selectedChips.add(citysuggestions[index]);
                  citysuggestions.removeAt(index);
                  widget.dynamicChipPressed();
                } else {
                  Flushbar(
                    /// Ovaj task radili su Amer i Faruk.
                    ///
                    /// Flushbar is some kind of snackbar that is showed in the bottom of the screen and display (in this case) an error and display a warning to the user
                    /// Once when user select 3 cities and try to add more in filter, code bellow will be triggered
                    title: FilterFlush().naslov,
                    //message: "Ne moze biti vise od 3 odabrana grada",
                    isDismissible: false,
                    //animationDuration: Duration(seconds: 12),
                    blockBackgroundInteraction: true,
                    icon: Icon(
                      Icons.error,
                      size: 34,
                      color: Colors.white,
                    ),
                    backgroundColor: mainAppColor,
                    barBlur: 10,
                    //duration: Duration(seconds: 12),
                    flushbarPosition: FlushbarPosition.BOTTOM,
                    boxShadows: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 3.0,
                      )
                    ],
                    progressIndicatorBackgroundColor: Colors.blue,
                    shouldIconPulse: true,
                    messageText: Text(
                      FlushBarText().message,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    flushbarStyle: FlushbarStyle.FLOATING,
                    borderRadius: 30.0,
                  )..show(context);
                }
              },
            ),
          );
        }),
      ),
    );
  }
}
