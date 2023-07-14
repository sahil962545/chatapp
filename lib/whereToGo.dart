import 'dart:async';
import 'package:chat_app_real/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login_page.dart';

// ignore: camel_case_types
class shprefadvanced extends StatefulWidget {
  const shprefadvanced({super.key});

  @override
  State<shprefadvanced> createState() => shprefadvancedState();
}

// ignore: camel_case_types
class shprefadvancedState extends State<shprefadvanced> {
  // ignore: non_constant_identifier_names
  String Keylogin = "Login";

  @override
  void initState() {
    super.initState();
    const Duration(seconds: 3);

    WheretoGo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/home.jpg'),
        fit: BoxFit.cover,
      )),
    );
  }

  // ignore: non_constant_identifier_names
  void WheretoGo() async {
    var sharedPref = await SharedPreferences.getInstance();

    var isLoggedIn = sharedPref.getBool(Keylogin);

    Timer(const Duration(seconds: 4), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Login_page(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Login_page(),
            ));
      }
    });
  }
}
