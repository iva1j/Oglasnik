import 'package:Oglasnik/utils/shared/globalVariables.dart';

import 'package:Oglasnik/view/RegisterHome/widgets/logoutButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successAlertDialog.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/successOnCreateAlertDialog.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';

class RegisteredHome extends StatefulWidget {
  @override
  _RegisteredHomeState createState() => _RegisteredHomeState();
}

//final GlobalKey<FabCircularMenuState> registerhomeKey = GlobalKey();

class _RegisteredHomeState extends State<RegisteredHome> {
  final keyIsFirstLoaded = 'is_first_loaded';
  @override
  void initState() {
    super.initState();
    if (registeredGlob) {
      registeredGlob = false;
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

  List<dynamic> products = [];
  @override
  Widget build(BuildContext context) {
    setState(() {
      isLoading = false;
    });
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppBarTheme.of(context).color,
        centerTitle: true,
        title: Text('Oglasnik'),
        leading: LogoutButton(),
      ),
      floatingActionButton: email != null
          ? mainFloatingButton(email)
          : homeFloatingAnimatedButton(),
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        color: Color.fromARGB(255, 226, 11, 48),
      ),
      body: MainBody(),
    );
  }
}
