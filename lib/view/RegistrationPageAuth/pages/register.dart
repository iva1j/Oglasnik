import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/utils/shared/logoContainer.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/formSignUp.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/signUpFormName.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/welcomeScreen.dart';
import 'package:Oglasnik/view/SignInPage/pages/signin.dart';
import 'package:Oglasnik/viewModel/SignUp/SignUpViewModel.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';

 GlobalKey<FormState> signUpRegisterFormKey = GlobalKey<FormState>();
TextEditingController signUpFullNameInputController;
TextEditingController signUpPhoneNumberInputController;
TextEditingController signUpEmailInputController;
TextEditingController signUpPasswordInputController;

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({Key key, this.toggleView}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  initState() {
    signUpFullNameInputController = new TextEditingController();
    signUpPhoneNumberInputController = new TextEditingController();
    signUpEmailInputController = new TextEditingController();
    signUpPasswordInputController = new TextEditingController();
    signUpRegisterFormKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    signUpRegisterFormKey.currentState.dispose();
    //signInRegisterFormKey.currentState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: backButtonIphone(context),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 100.0, right: 100.0, bottom: 5.0),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
            ),
          ),
          color: Colors.white,
          onPressed: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => SigninPage(),
              ),
            );

            cleanInputFields(
                signUpFullNameInputController,
                signUpPhoneNumberInputController,
                signUpEmailInputController,
                signUpPasswordInputController);
          },
          child: Text(
            'Prijavi se',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) {
          return AnonymouseHome();
        })),
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Container(
                height: SizeConfig.screenHeight,
                margin: EdgeInsets.all(50),
                child: Column(
                  children: <Widget>[
                    LogoContainer(),
                    WelcomeScreen(),
                    Container(
                      child: AuthService().checkStatus(context, emailRegister),
                    ),
                    SignUpFormName(),
                    FormSignUp(
                        registerFormKey: signUpRegisterFormKey,
                        signUpFullNameInputController:
                            signUpFullNameInputController,
                        signUpEmailInputController: signUpEmailInputController,
                        signUpPasswordInputController:
                            signUpPasswordInputController,
                        signUpPhoneNumberInputController:
                            signUpPhoneNumberInputController),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
