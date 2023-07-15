import 'package:chat_app_real/callsPage.dart';
import 'package:chat_app_real/chatpage.dart';
import 'package:chat_app_real/groupPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ontip = false;
  Future pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: appstate(),
          body: const TabBarView(children: [
            chatpage(),
            groupPage(),
            callsPage(),
          ]),
        ));
  }

  AppBar appstate() {
    if (ontip == false) {
      return AppBar(
        actions: [
          SizedBox(
            height: 30,
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    pickImage();
                  },
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        ontip = true;
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ],
            ),
          )
        ],
        backgroundColor: const Color.fromARGB(255, 2, 106, 4),
        title: const Text(
          "Chatapp",
          style: TextStyle(color: Colors.white),
        ),
        bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "Chats",
              ),
              Tab(text: "Group"),
              Tab(
                text: "Calls",
              )
            ]),
      );
    } else {
      return AppBar(
        title: const TextField(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  ontip = false;
                });
              },
              icon: Icon(Icons.cancel)),
        ],
      );
    }
  }
}
