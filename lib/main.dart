import 'package:finalprject/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBrn5YxcFezo2Y-Ikp7Oqk2t1oHVbeZiBE',
      appId: '1:909432620900:android:7c595bcd7c3ceb22ebdc71',
      messagingSenderId: '909432620900',
      projectId: 'flutter-app-7f60c',
      storageBucket: 'flutter-app-7f60c.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: LoginPage(
        RegisterPage: () {},
      ),
    );
  }
}
