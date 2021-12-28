import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_db/services/authentication_service.dart';
import 'package:firebase_auth_db/services/google_sign_in.dart';
import 'package:firebase_auth_db/screens/homepage.dart';
import 'package:firebase_auth_db/screens/menu.dart';
import 'package:firebase_auth_db/screens/onboarding.dart';
import 'package:firebase_auth_db/screens/signin.dart';
import 'package:firebase_auth_db/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'services/google_sign_in.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
        ListenableProvider<GoogleSignInProvider>(
            create: (context) => GoogleSignInProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'DM Sans',
          primarySwatch: Colors.blue,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            User? user = snapshot.data;
            return HomePage();
          }

          return Menu();
        });
  }
}
