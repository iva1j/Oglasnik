import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successAlertDialog.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Oglasnik/utils/colorThemes.dart';

class RegisteredHome extends StatefulWidget {
  @override
  _RegisteredHomeState createState() => _RegisteredHomeState();
}

final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

class _RegisteredHomeState extends State<RegisteredHome> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) => successAlertDialog(context));
    });
  }

  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        //backgroundColor: mainAppColor,
        //backgroundColor: Color.fromARGB(255, 226, 11, 48),
        centerTitle: true,
        title: Text('Oglasnik'),
        leading: IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            /*
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AnonymouseHome()));*/
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('email');
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext ctx) => AnonymouseHome()));
          },
          icon: Icon(
            Icons.power_settings_new,
            color: Colors.black,
            size: SizeConfig.blockSizeHorizontal * 10,
          ),
        ),
      ),
      floatingActionButton: mainFloatingButton(),
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: Color.fromARGB(255, 226, 11, 48),
      ),
    );
  }
}
