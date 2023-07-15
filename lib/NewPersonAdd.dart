import 'package:flutter/material.dart';

class NewPersonAdd extends StatefulWidget {
  const NewPersonAdd({super.key});

  @override
  State<NewPersonAdd> createState() => _NewPersonAddState();
}

class _NewPersonAddState extends State<NewPersonAdd> {
  bool ontip = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appstate(),
    );
  }

  AppBar appstate() {
    if (ontip == false) {
      return AppBar(
        title: const Text("search people"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  ontip = true;
                });
              },
              icon: const Icon(Icons.search)),
        ],
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
