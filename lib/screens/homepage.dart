import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_db/services/google_sign_in.dart';
import 'package:firebase_auth_db/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD94928),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.read<AuthenticationService>().signOut();
              context.read<GoogleSignInProvider>().googleSignOut();
            },
          ),
        ],
      ),
    );
  }
}
