// import 'package:Oglasnik/utils/shared/logoContainer.dart';
// import 'package:Oglasnik/view/RegistrationPageAuth/widgets/welcomeScreen.dart';
// import 'package:Oglasnik/view/SignInPage/widgets/formSignIn-InactiveForNow.dart';
// import 'package:flutter/material.dart';
// import 'package:Oglasnik/view/SignInPage/widgets/welcomeLoginScreen.dart';

// class SignInContainer extends StatelessWidget {
//   const SignInContainer({
//     Key key,
//     @required GlobalKey<FormState> registerFormKey,
//     @required this.emailInputController,
//     @required this.passwordInputController,
//   })  : _registerFormKey = registerFormKey,
//         super(key: key);

//   final GlobalKey<FormState> _registerFormKey;
//   final TextEditingController emailInputController;
//   final TextEditingController passwordInputController;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         LogoContainer(),
//         Container(
//           child: Column(
//             children: <Widget>[
//               WelcomeScreen(),
//             ],
//           ),
//         ),
//         WelcomeLoginScreen(),
//         SignInForm(
//           registerFormKey: _registerFormKey,
//           emailInputController: emailInputController,
//           passwordInputController: passwordInputController,
//         ),
//       ],
//     );
//   }
// }
