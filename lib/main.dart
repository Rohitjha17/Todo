// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, unused_local_variable, annotate_overrides

import 'package:firebase_todo/pages/homepage.dart';
import 'package:firebase_todo/pages/signup.dart';
import 'package:firebase_todo/pages/splashscreen.dart';
import 'package:firebase_todo/service/google_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget? currentPage;
  AuthClass authClass = AuthClass();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String? token = await authClass.getToken();
    setState(() {
      currentPage = token != null ? HomePage() : SignUpPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
