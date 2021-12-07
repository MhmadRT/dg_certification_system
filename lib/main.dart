import 'package:dg_certification_system/view/screens/login_screen.dart';
import 'package:dg_certification_system/view/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
var cardColor = const Color(0xffffffff);
var secondColor = const Color(0xffFDBF2F);
String appLang = 'ar';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'alfont',
        backgroundColor: const Color(0xffF0F0F0),
        cardColor: const Color(0xffF0F1F2),
        scaffoldBackgroundColor: const Color(0xffffffff),
        primaryColor: const Color(0xffF84B63),
        accentColor: const Color(0xff393d47),
        hintColor: const Color(0xff8d7861),
        appBarTheme: const AppBarTheme(
          color: Color(0xffF0F0F0),
          elevation: 0.0,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
