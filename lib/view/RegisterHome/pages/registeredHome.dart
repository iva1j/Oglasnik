import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successAlertDialog.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successOnCreateAlertDialog.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/logoutButton.dart';

class RegisteredHome extends StatefulWidget {
  @override
  _RegisteredHomeState createState() => _RegisteredHomeState();
}

final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

class _RegisteredHomeState extends State<RegisteredHome> {
  final keyIsFirstLoaded = 'is_first_loaded';
  @override
  void initState() {
    super.initState();

    if (registeredGlob) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog<String>(
            context: context,
            builder: (BuildContext context) => successAlertDialog(context));
      });
    }

    if (createdGlob) {
      createdGlob = false;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                successOnCreateAlertDialog(context));
      });
    }
  }

  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text('Oglasnik'),
        leading: LogoutButton(),
      ),
      floatingActionButton: mainFloatingButton(email),
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: Color.fromARGB(255, 226, 11, 48),
      ),
      body: Column(
        children: <Widget>[
          //CategoryCard(),
          //ProductBrandCard(),
        ],
      ),
    );
  }
}
