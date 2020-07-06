import 'package:Oglasnik/utils/groupOfFunctions.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/validation.dart';
import 'package:Oglasnik/utils/specialElements.dart';
import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/view/AnonymousHome/pages/anonymousHome.dart';
import 'package:Oglasnik/utils/shared/logoContainer.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/onPressedRegister.dart';
import 'package:Oglasnik/view/RegistrationPageAuth/widgets/welcomeScreen.dart';
import 'package:Oglasnik/view/SignInPage/pages/signin.dart';
import 'package:Oglasnik/viewModel/authViewModel.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;
  RegisterPage({Key key, this.toggleView}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController fullNameInputController;
  TextEditingController phoneNumberInputController;
  TextEditingController emailInputController;
  TextEditingController passwordInputController;

  // void toggleView() {
  //   setState(() => showSignIn = !showSignIn);
  // }

  @override
  initState() {
    //RegisterControllers();
    TextEditingController fullNameInputController = new TextEditingController();
    TextEditingController phoneNumberInputController =
        new TextEditingController();
    TextEditingController emailInputController = new TextEditingController();
    TextEditingController passwordInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String fullName, email, password, phoneNumber;
    fullName = fullNameInputController.text;
    email = emailInputController.text;
    phoneNumber = phoneNumberInputController.text;
    password = passwordInputController.text;
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    // if (showSignIn) {
    //   return SigninPage(toggleView: toggleView);
    // } else {
    //   return RegisterPage(toggleView: toggleView);
    // }
    dynamic formKey;
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
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => SigninPage(),
              ),
            );

            //widget.toggleView();
            //isRegistered ? formRegister(fullNameInputController.text, email, password, phoneNumber, formKey, context) : formSignin(email, password, formKey, context);
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
        // height: 60,
        // width: double.infinity,
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
                      child:
                          AuthService().checkStatus(context, email, password),
                    ),
                    nameOfForm(),
                    formRegister(fullName, email, password, phoneNumber,
                        formKey, context)
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Form formRegister(String fullName, String email, String password,
      String phoneNumber, formKey, BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(children: <Widget>[
        new Container(
          margin: EdgeInsets.only(top: 15, bottom: 10),
          child: new SizedBox(
            width: double.infinity,
            child: Container(
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Ime i prezime',
                  contentPadding: EdgeInsets.only(left: 20),
                ),
                controller: fullNameInputController,
                keyboardType: TextInputType.text,
                validator: nameValidator,
              ),
            ),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(bottom: 10),
          child: new SizedBox(
            width: double.infinity,
            child: Container(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.only(left: 20),
                ),
                controller: emailInputController,
                //keyboardType: TextInputType.emailAddress,
                keyboardType: TextInputType.visiblePassword,
                validator: emailRegisterCheck,
              ),
            ),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(bottom: 10),
          child: new SizedBox(
            width: double.infinity,
            child: Container(
              child: TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(),
                  hintText: 'Lozinka',
                  contentPadding: EdgeInsets.only(left: 20),
                ),
                controller: passwordInputController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: passwordValidator,
              ),
            ),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(bottom: 30),
          child: new SizedBox(
            width: double.infinity,
            child: Container(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  hintText: 'Broj telefona',
                ),
                controller: phoneNumberInputController,
                keyboardType: TextInputType.phone,
                validator: phoneValidator,
              ),
            ),
          ),
        ),
        button(
          App_Labels_Auth().registracija,
          () {
            fullName = fullNameInputController.text;
            email = emailInputController.text;
            password = passwordInputController.text;
            phoneNumber = phoneNumberInputController.text;
            formKey = registerFormKey;
            onPressedRegister(
                context, fullName, email, password, phoneNumber, formKey);
          },
        ),
      ]),
    );
  }

  Container nameOfForm() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        'Registracija',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    );
  }
}
