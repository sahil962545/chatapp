import 'package:chat_app_real/MyHomePage.dart';
import 'package:chat_app_real/Reset.dart';
import 'package:chat_app_real/signUp.dart';
import 'package:chat_app_real/whereToGo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  @override
  Widget build(BuildContext context) {
    String email = " ";
    String pass = " ";
    return Scaffold(
        body: Stack(
      children: [
        ClipPath(
          clipper: Maxclapper(),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.green.shade300,
          ),
        ),
        ClipPath(
          clipper: waveclapper(),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.cyan.shade100,
          ),
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
                          "Login",
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
                                label: Text('E-mail'),
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
                                          .signInWithEmailAndPassword(
                                    email: email,
                                    password: pass,
                                  );
                                  var sharedpref =
                                      await SharedPreferences.getInstance();
                                  sharedpref.setBool(
                                      shprefadvancedState().Keylogin, true);

                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MyHomePage(),
                                      ));
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    print(
                                        'Wrong password provided for that user.');
                                  }
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Reset(),
                                  ));
                            },
                            child: const Text(
                              "Forget your password ?",
                              style: TextStyle(color: Colors.blue),
                            ))
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    width: 150,
                    child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.cyan),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Twitter",
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have account ?",
                    style: TextStyle(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ));
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}

class waveclapper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 450); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, 450);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, 450 - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3.24), 450 - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, 450 - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }
}

class Maxclapper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 452); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, 452);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, 452 - 50);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 4), 452 - 80);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, 452);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }
}
