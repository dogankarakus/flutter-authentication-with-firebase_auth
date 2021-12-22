import 'package:firebase_auth_db/services/authentication_service.dart';
import 'package:firebase_auth_db/screens/menu.dart';
import 'package:firebase_auth_db/screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isObscure = true;
  final Color buttonColor = Color(0xffD94928);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height - 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "Welcome back!",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Yaay! Enter your password to continue",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                buildEmailField(),
                SizedBox(
                  height: 8,
                ),
                buildPasswordField('Enter your password'),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          image:
                              AssetImage("lib/assets/images/signin_icon.png")),
                      Text(
                        "Face ID",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Forgot password?',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Menu()));
                          },
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffD94928),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "Don't have an account yet? "),
                      TextSpan(
                        text: ' Sign Up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffD94928),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 40,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(buttonColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      context.read<AuthenticationService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
