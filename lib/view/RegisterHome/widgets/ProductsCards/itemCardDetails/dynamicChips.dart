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
              onPressed: () {
                if (selectedChips.length < 3) {
                  widget.dynamicChipPressed();
                  setState(() {
                    selectedChips.add(citysuggestions[index]);
                    citysuggestions.removeAt(index);
                  });
                } else {
                  Flushbar(
                    title: "Pogreška!",
                    //message: "Ne moze biti vise od 3 odabrana grada",

                    icon: Icon(
                      Icons.error,
                      size: 34,
                      color: Colors.white,
                    ),
                    backgroundColor: mainAppColor,
                    barBlur: 10,

                    duration: Duration(seconds: 5),
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
