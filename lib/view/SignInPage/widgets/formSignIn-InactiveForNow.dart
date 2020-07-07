// import 'package:Oglasnik/utils/specialElements.dart';
// import 'package:Oglasnik/utils/validation.dart';
// import 'package:Oglasnik/view/SignInPage/widgets/alertdialog.dart';
// import 'package:Oglasnik/viewModel/authViewModel.dart';
// import 'package:flutter/material.dart';
// import 'package:Oglasnik/utils/strings.dart';

// class SignInForm extends StatelessWidget {
//   const SignInForm({
//     final Key key,
//     @required GlobalKey<FormState> registerFormKey,
//     @required this.emailInputController,
//     @required this.passwordInputController,
//   }) : super(key: key);

//   final TextEditingController emailInputController;
//   final TextEditingController passwordInputController;

//   @override
//   Widget build(BuildContext context) {
//     String email = emailInputController.text;
//     // String password = passwordInputController.text;

//     return Form(
//       key: registerFormKey,
//       child: Column(children: <Widget>[
//         new Container(
//           margin: EdgeInsets.only(bottom: 10),
//           child: new SizedBox(
//             width: double.infinity,
//             child: Container(
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   contentPadding: EdgeInsets.only(left: 20),
//                 ),
//                 controller: emailInputController,
//                 keyboardType: TextInputType.visiblePassword,
//                 validator: emailValidator,
//               ),
//             ),
//           ),
//         ),
//         new Container(
//           margin: EdgeInsets.only(bottom: 10),
//           child: new SizedBox(
//             width: double.infinity,
//             child: Container(
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Lozinka',
//                   contentPadding: EdgeInsets.only(left: 20),
//                 ),
//                 controller: passwordInputController,
//                 keyboardType: TextInputType.visiblePassword,
//                 obscureText: true,
//                 validator: passwordValidator,
//               ),
//             ),
//           ),
//         ), //#TODO destroy registerFormKey
//         Container(
//           child: AuthService().checkStatus(context, email),
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 20.0),
//           child: button(
//             'Prijavi se',
//             () async {
//               globalKey();
//               if (registerFormKey.currentState.validate()) {
//                 // Navigator.of(context).pushReplacement(
//                 //     MaterialPageRoute(builder: (_) => RegisteredHome()));
//               }
//             },
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 15.0),
//           child: new GestureDetector(
//             onTap: () => displayDialog(context),
//             child: new Text(
//               "Zaboravili ste lozinku?",
//               style: TextStyle(
//                   fontFamily: 'Roboto',
//                   fontSize: 16,
//                   color: Color.fromRGBO(0, 0, 0, 102)),
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }
