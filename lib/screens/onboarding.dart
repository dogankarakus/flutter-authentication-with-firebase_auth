import 'package:firebase_auth_db/main.dart';
import 'package:firebase_auth_db/screens/menu.dart';
import 'package:firebase_auth_db/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Container(
          height: MediaQuery.of(context).size.height - 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage("lib/assets/images/onboarding.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                              image: AssetImage(
                                  "lib/assets/images/onboarding_progress.png")),
                          Image(
                              image: AssetImage(
                                  "lib/assets/images/onboarding_progress_dot.png")),
                          Image(
                              image: AssetImage(
                                  "lib/assets/images/onboarding_progress_dot.png")),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AuthenticationWrapper()));
                        },
                        iconSize: 64,
                        icon: Image(
                          image: AssetImage(
                              "lib/assets/images/onboarding_nextpage.png"),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
