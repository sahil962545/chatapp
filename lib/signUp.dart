import 'package:chat_app_real/Login_page.dart';
import 'package:chat_app_real/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = " ";
  String pass = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.cyan.shade100,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SizedBox(
                      height: 400,
                      width: 280,
                      child: Column(
                        children: [
                          const Text(
                            "Create your account!",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                  label: const Text('E-mail'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ))),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            onChanged: (value) {
                              pass = value;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                label: const Text('Password'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                label: const Text('Confirm Password'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 300,
                            child: ElevatedButton(
                                onPressed: () async {
                                  try {
                                    // ignore: unused_local_variable
                                    UserCredential userCredential =
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                      email: email,
                                      password: pass,
                                    );
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Profile_page(),
                                        ));
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      print(
                                          'The password provided is too weak.');
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      print(
                                          'The account already exists for that email.');
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue),
                                ),
                                child: const Text(
                                  "Signup",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: SizedBox(
                    width: 300,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 10,
                          width: 90,
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.2,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("or connect with"),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 10,
                          width: 90,
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 150,
                          child: ElevatedButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.cyan),
                              ),
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.googlePlusG,
                                color: Colors.redAccent.shade100,
                              ),
                              label: const Text(
                                "mail",
                                style: TextStyle(color: Colors.white),
                              ))),
                      SizedBox(
                          width: 150,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.indigo)),
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.squareFacebook,
                                color: Colors.white),
                            label: const Text(
                              "Facebook",
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
