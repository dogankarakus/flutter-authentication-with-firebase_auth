import 'package:firebase_auth_db/services/google_sign_in.dart';
import 'package:firebase_auth_db/screens/signin.dart';
import 'package:firebase_auth_db/screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final Color color = Color(0xffD94928);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Image(image: AssetImage("lib/assets/images/menuimage.png")),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Hey there, Welcome back!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Login to your account to continue",
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width - 40,
                child: ElevatedButton.icon(
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.black54,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(8.0)),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  },
                  label: Text(
                    "Sign up with Google",
                    style: TextStyle(color: color, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width - 40,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(color),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(8.0)),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: Text(
                    "Sign up with Email",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "Already have an account? "),
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
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
