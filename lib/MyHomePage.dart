// ignore: file_names
import 'package:chat_app_real/callsPage.dart';
import 'package:chat_app_real/chatpage.dart';
import 'package:chat_app_real/groupPage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: const [
              SizedBox(
                height: 30,
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
            backgroundColor: Color.fromARGB(255, 2, 106, 4),
            title: const Text(
              "Chatap",
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
          ),
          body: const TabBarView(children: [
            chatpage(),
            groupPage(),
            callsPage(),
          ]),
        ));
  }
}
