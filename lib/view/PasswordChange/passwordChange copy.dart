import 'package:Oglasnik/model/userModel.dart';
import 'package:Oglasnik/utils/form_input_field_with_icon.dart';
import 'package:Oglasnik/utils/label_button.dart';
import 'package:Oglasnik/utils/loading_screen.dart';
import 'package:Oglasnik/utils/primary_button.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/widgets/specialElements.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordChange extends StatefulWidget {
  @override
  _PasswordChangeState createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //final labels = AppLocalizations.of(context);
  AuthService _auth = AuthService();
  bool _loading = false;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController _email;
  TextEditingController _name;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  initState() {
    // _email = new TextEditingController();
    // _name = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  String passwordValidator(String value) {
    if (value.length == null || value == '')
      return 'Polje ne smije biti prazno';
    if (value.length <= 8) {
      return 'Password ne smije biti manji od 8 char';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    dynamic formKey;
    String email, password;
    // email = emailInputController.text;
    // password = passwordInputController.text;

    // return Scaffold(
    //   resizeToAvoidBottomPadding: false,
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     elevation: 0.0,
    //     leading: IconButton(
    //         icon: Icon(
    //           Icons.clear,
    //           color: Colors.black,
    //           size: 24,
    //         ),
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         }),
    //   ),
    //   body: SingleChildScrollView(
    //     reverse: true,
    //     child: Padding(
    //       padding: EdgeInsets.only(bottom: bottom),
    //       child: Container(
    //           height: SizeConfig.screenHeight,
    //           margin: EdgeInsets.all(50),
    //           child: Column(children: <Widget>[
    //             Container(
    //               margin: EdgeInsets.only(bottom: 90.0),
    //               child: Text(
    //                 "Promijeni šifru",
    //                 style: TextStyle(
    //                     fontSize: 20,
    //                     fontFamily: 'Roboto',
    //                     fontWeight: FontWeight.normal),
    //               ),
    //             ),
    //             LoadingScreen(
    //               child: updateProfileForm(context),
    //               inAsyncCall: _loading,
    //               //                  color: Theme.of(context).scaffoldBackgroundColor,
    //             ),
    //           ])),
    //     ),
    //   ),
    // );
    return Scaffold(
        key: _scaffoldKey,
        //    appBar: AppBar(title: Text(labels.auth.updateProfileTitle),),
        body: LoadingScreen(
          child: updateProfileForm(context),
          inAsyncCall: _loading,
          color: Theme.of(context).scaffoldBackgroundColor,
        ));
  }

//new form for testing

  updateProfileForm(BuildContext context) {
    final User user = User();
    // create: (_) => Provider.of<User>(context);

    // _name.text = user?.fullName;
    //_email.text = user?.email;
    //final labels = AppLocalizations.of(context);
    return Form(
      key: _registerFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //    LogoGraphicHeader(),
                SizedBox(height: 48.0),
                FormInputFieldWithIcon(
                  controller: _name,
                  iconPrefix: Icons.person,
                  //  labelText: labels.auth.nameFormField,
                  // validator: Validator(labels).name,
                  onChanged: (value) => null,
                  onSaved: (value) => _name.text = value,
                ),
                // FormVerticalSpace(),
                FormInputFieldWithIcon(
                  controller: _email,
                  iconPrefix: Icons.email,
                  // labelText: labels.auth.emailFormField,
                  // validator: Validator(labels).email,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => null,
                  onSaved: (value) => _email.text = value,
                ),
                //FormVerticalSpace(),
                PrimaryButton(
                    // labelText: labels.auth.updateUser,
                    onPressed: () {
                  if (_registerFormKey.currentState.validate()) {
//                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                    User _updatedUser = User(
                      userID: user?.userID,
                      fullName: _name.text,
                      email: _email.text,
                      //photoUrl: user?.photoUrl,
                    );
                    _updateUserConfirm(context, _updatedUser, user?.email);
                  }
                }),
                //FormVerticalSpace(),
                LabelButton(
                    //  labelText: labels.auth.changePasswordLabelButton,
                    onPressed: () => Navigator.pushNamed(
                        context, '/reset-password',
                        arguments: user.email)),
              ],
            ),
          ),
        ),
      ),
    );
  }

// _updateUserConfirm -> button

  Future<bool> _updateUserConfirm(
      BuildContext context, User updatedUser, String oldEmail) async {
    //final labels = AppLocalizations.of(context);
    AuthService _auth = AuthService();
    final TextEditingController _password = new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            title: Text('enter password'
                //        labels.auth.enterPassword,
                ),
            content: FormInputFieldWithIcon(
              controller: _password,
              iconPrefix: Icons.lock,
              //      labelText: labels.auth.passwordFormField,
              //    validator: Validator(labels).password,
              obscureText: true,
              onChanged: (value) => null,
              onSaved: (value) => _password.text = value,
              maxLines: 1,
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                    'labels.auth.cancel.toUpperCase()'), //   instead of this text, we will add other
                //  child: new Text('cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    _loading = false;
                  });
                },
              ),
              new FlatButton(
                child: new Text('labels.auth.submit.toUpperCase()'),
                //child: new Text('submit'),
                onPressed: () async {
                  setState(() {
                    _loading = true;
                  });
                  Navigator.of(context).pop();
                  try {
                    await _auth
                        .updateUser(updatedUser, oldEmail, _password.text)
                        .then((result) {
                      setState(() {
                        _loading = false;
                      });

                      if (result == true) {
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            // content: Text(labels.auth.updateUserSuccessNotice),
                            content: Text(''),
                          ),
                        );
                      }
                    });
                  } catch (error) {
                    //List<String> errors = error.toString().split(',');
                    // print("Error: " + errors[1]);
                    print(error.code);
                    String authError;
                    switch (error.code) {
                      case 'ERROR_WRONG_PASSWORD':
                        //authError = labels.auth.wrongPasswordNotice;
                        authError = 'labels.auth.wrongPasswordNotice';
                        break;
                      default:
                        //authError = labels.auth.unknownError;
                        authError = ' labels.auth.unknownError';
                        break;
                    }
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text(authError),
                    ));
                    setState(() {
                      _loading = false;
                    });
                  }
                },
              )
            ],
          );
        });
  }
}

//form created by Iva
// Form(
//                     key: _registerFormKey,
//                     child: Column(children: <Widget>[
//                       // new Container(
//                       //   margin: EdgeInsets.only(bottom: 10),
//                       //   child: new SizedBox(
//                       //     width: double.infinity,
//                       //     child: Container(
//                       //       child: TextFormField(
//                       //         decoration: InputDecoration(
//                       //           hintText: 'Unesi kod',
//                       //         ),
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                       new Container(
//                         margin: EdgeInsets.only(bottom: 10),
//                         child: new SizedBox(
//                           width: double.infinity,
//                           child: Container(
//                             child: TextFormField(
//                               decoration: InputDecoration(
//                                 hintText: 'Nova šifra',
//                               ),
//                               controller: passwordInputController,
//                             ),
//                           ),
//                         ),
//                       ),
//                       // new Container(
//                       //   margin: EdgeInsets.only(bottom: 30),
//                       //   child: new SizedBox(
//                       //     width: double.infinity,
//                       //     child: Container(
//                       //       child: TextFormField(
//                       //         decoration: InputDecoration(
//                       //           hintText: 'Potvrdi šifru',
//                       //         ),
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                       Container(
//                         margin: EdgeInsets.only(top: 110),
//                         child: button('Sačuvaj', () async {
//                           password = passwordInputController.text;
//                           formKey = _registerFormKey;

//                           User _updatedUser = User(
//                               userID: user?.uid,
//                               name: _name.text,
//                               email: _email.text,
//                               photoUrl: user?.photoUrl);
//                           _updateUserConfirm(
//                               context, _updatedUser, user?.email);

//                           //   try {
//                           //     await await _auth
//                           //         .updateUser(
//                           //             updatedUser, oldEmail, _password.text)
//                           //         .then((result) {
//                           //       if (result == true) {
//                           //         print('User uspješno update-ovan.');
//                           //       }
//                           //     });
//                           //   } catch (error) {
//                           //     print(error.code);
//                           //   }
//                         }),
//                       ),
//                     ]),
//                   )

// Future<bool> _updateUserConfirm(
//     BuildContext context, User updatedUser, String oldEmail) async {
//  // final labels = AppLocalizations.of(context);
//   AuthService _auth = AuthService();
//   final TextEditingController _password = new TextEditingController();
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(8.0))),
//           title: Text(
//    //         labels.auth.enterPassword,
//           ),
//           content: FormInputFieldWithIcon(
//             controller: _password,
//             iconPrefix: Icons.lock,
//             labelText: labels.auth.passwordFormField,
//             validator: Validator(labels).password,
//             obscureText: true,
//             onChanged: (value) => null,
//             onSaved: (value) => _password.text = value,
//             maxLines: 1,
//           ),
//           actions: <Widget>[
//             new FlatButton(
//               child: new Text(labels.auth.cancel.toUpperCase()),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 setState(() {
//                   _loading = false;
//                 });
//               },
//             ),
//             new FlatButton(
//               child: new Text(labels.auth.submit.toUpperCase()),
//               onPressed: () async {
//                 setState(() {
//                   _loading = true;
//                 });
//                 Navigator.of(context).pop();
//                 try {
//                   await _auth
//                       .updateUser(updatedUser, oldEmail, _password.text)
//                       .then((result) {
//                     setState(() {
//                       _loading = false;
//                     });

//                     if (result == true) {
//                       _scaffoldKey.currentState.showSnackBar(
//                         SnackBar(
//                           content:
//                               Text(labels.auth.updateUserSuccessNotice),
//                         ),
//                       );
//                     }
//                   });
//                 } on PlatformException catch (error) {
//                   //List<String> errors = error.toString().split(',');
//                   // print("Error: " + errors[1]);
//                   print(error.code);
//                   String authError;
//                   switch (error.code) {
//                     case 'ERROR_WRONG_PASSWORD':
//                       authError = labels.auth.wrongPasswordNotice;
//                       break;
//                     default:
//                       authError = labels.auth.unknownError;
//                       break;
//                   }
//                   _scaffoldKey.currentState.showSnackBar(SnackBar(
//                     content: Text(authError),
//                   ));
//                   setState(() {
//                     _loading = false;
//                   });
//                 }
//               },
//             )
//           ],
//         );
//       });
// }

//MD5

// import 'package:crypto/crypto.dart' as crypto;
// ///Generate MD5 hash
// generateMd5(String data) {
//   var content = UTF8.encode(data);
//   var md5 = crypto.md5;
// }

// or

// import 'dart:convert';
// import 'package:crypto/crypto.dart';

// String generateMd5(String input) {
//   return md5.convert(utf8.encode(input)).toString();
// }
