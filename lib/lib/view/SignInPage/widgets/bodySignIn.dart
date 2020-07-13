// import 'package:Oglasnik/utils/sizeconfig.dart';
// import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
// import 'package:Oglasnik/view/SignInPage/widgets/signInContainer.dart';
// import 'package:flutter/material.dart';

// class BodySignIn extends StatelessWidget {
//   const BodySignIn({
//     Key key,
//     @required this.bottom,
//     @required GlobalKey<FormState> registerFormKey,
//     @required this.emailInputController,
//     @required this.passwordInputController,
//   }) : _registerFormKey = registerFormKey, super(key: key);

//   final double bottom;
//   final GlobalKey<FormState> _registerFormKey;
//   final TextEditingController emailInputController;
//   final TextEditingController passwordInputController;

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (_) {
//         return AnonymouseHome();
//       })),
//       child: SingleChildScrollView(
//         reverse: true,
//         child: Padding(
//           padding: EdgeInsets.only(bottom: bottom),
//           child: Container(
//             height: SizeConfig.screenHeight,
//             margin: EdgeInsets.all(50),
//             child: SignInContainer(
//                 registerFormKey: _registerFormKey,
//                 emailInputController: emailInputController,
//                 passwordInputController: passwordInputController),
//           ),
//         ),
//       ),
//     );
//   }
// }
