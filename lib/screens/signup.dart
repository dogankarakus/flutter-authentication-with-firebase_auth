// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:firebase_auth_db/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'signin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final Color buttonColor = Color(0xffD94928);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'or'),
                            TextSpan(
                              text: ' Sign in',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInPage()));
                                },
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffD94928),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: (MediaQuery.of(context).size.width - 50) / 2,
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'firstname',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0), width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: (MediaQuery.of(context).size.width - 50) / 2,
                            height: 60,
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'lastname',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffE0E0E0), width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusColor: Color(0xffE0E0E0),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    buildEmailField(),
                    SizedBox(
                      height: 8,
                    ),
                    buildPhoneField(),
                    SizedBox(
                      height: 8,
                    ),
                    buildPasswordField('Password'),
                    SizedBox(
                      height: 8,
                    ),
                    buildPasswordField('Confirm password'),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        "Must be at least 8 characters including upper, lower case letters and or a symbol ( e.g ythhYT8!)"),
                    SizedBox(
                      height: 20,
                    ),
                    buildSignUpButton(buttonColor),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'By tapping Register, you agree to our '),
                            TextSpan(
                                text: 'Terms of use ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'and '),
                            TextSpan(
                                text: 'Privacy',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPhoneField() {
    return SizedBox(
        height: 60,
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: 'Phone number',
            prefixIcon: ImageIcon(
              AssetImage("lib/assets/images/signin_phonenumbericon.png"),
            ),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xffE0E0E0), width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusColor: Color(0xffE0E0E0),
          ),
        ));
  }

  Widget buildSignUpButton(Color buttonClr) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width - 40,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonClr),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
        onPressed: () {
          context.read<AuthenticationService>().signUp(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
        },
        child: Text(
          "Sign up",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: emailController,
        textCapitalization: TextCapitalization.none,
        key: ValueKey('email'),
        autocorrect: false,
        enableSuggestions: false,
        validator: (value) {
          final pattern = r'^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$';
          final regExp = RegExp(pattern);

          if (!regExp.hasMatch(value!)) {
            return 'Enter a valid mail';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: 'Email',
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE0E0E0), width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusColor: Color(0xffE0E0E0),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget buildPasswordField(String label) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        controller: passwordController,
        textCapitalization: TextCapitalization.none,
        key: ValueKey('password'),
        autocorrect: false,
        enableSuggestions: false,
        validator: (value) {
          if (value!.isEmpty || value.length < 7) {
            return 'Password must be at least 7 characters long.';
          }
        },
        obscureText: true,
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE0E0E0), width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusColor: Color(0xffE0E0E0),
        ),
      ),
    );
  }
}
