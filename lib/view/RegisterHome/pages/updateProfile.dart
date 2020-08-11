import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/pages/registeredHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextEditingController updateFullNameInputController;
TextEditingController updatePhoneNumberInputController;
TextEditingController updateEmailInputController;

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context)
                .pushReplacement(FadeRoute(page: RegisteredHome())),
          ),
        ),
        body: WillPopScope(
          onWillPop: () => Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) {
            return RegisteredHome();
          })),
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottom),
              child: Container(
                margin: EdgeInsets.all(45),
                child: Form(
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.black54,
                      errorColor: Colors.red,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: new SizedBox(
                            width: double.infinity,
                            child: Container(
                              child: TextFormField(
                                inputFormatters: [
                                  new BlacklistingTextInputFormatter(
                                    RegExp(
                                        '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
                                  ),
                                ],
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration(
                                  hintText: 'Ime i prezime',
                                  contentPadding: EdgeInsets.only(left: 20),
                                ),
                                controller: updateFullNameInputController,
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: new SizedBox(
                            width: double.infinity,
                            child: Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  contentPadding: EdgeInsets.only(left: 20),
                                ),
                                controller: updateEmailInputController,
                                keyboardType: TextInputType.visiblePassword,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: new SizedBox(
                            width: double.infinity,
                            child: Container(
                              child: TextFormField(
                                inputFormatters: [
                                  new BlacklistingTextInputFormatter(
                                    RegExp(
                                        '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
                                  ),
                                ],
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'Broj telefona',
                                ),
                                controller: updatePhoneNumberInputController,
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
