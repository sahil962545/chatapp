import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login_page.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  String reset = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Enter your Emaik",
                style: TextStyle(fontSize: 35),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  reset = value;
                },
                decoration: InputDecoration(
                    label: const Text("E-mail"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var forgetEmail = reset.trim();
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: forgetEmail)
                          .then((value) => {
                                print("email sent!"),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login_page(),
                                    ))
                              });
                    } on FirebaseAuthException catch (e) {
                      // ignore: avoid_print
                      print("Error $e");
                    }
                  },
                  child: const Text("Forget Password")),
            ],
          ),
        ),
      ),
    );
  }
}
