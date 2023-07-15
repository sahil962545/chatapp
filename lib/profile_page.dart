import 'dart:io';

import 'package:chat_app_real/MyHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class Profile_page extends StatefulWidget {
  const Profile_page({super.key});

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

// ignore: camel_case_types
class _Profile_pageState extends State<Profile_page> {
  File? imageFile;

  TextEditingController fullnamecontroller = TextEditingController();

  void selectImage(ImageSource source) async {
    // ignore: non_constant_identifier_names
    XFile? pickedfile = await ImagePicker().pickImage(source: source);
    if (pickedfile != null) {
      cropImage(pickedfile);
    }
  }

  void cropImage(XFile file) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: file.path);
    if (croppedImage != null) {
      setState(() {
        imageFile = File(croppedImage!.path);
      });
    }
  }

  void showPhotoOption() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Upload profile picture"),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
                selectImage(ImageSource.gallery);
              },
              leading: const Icon(Icons.photo),
              title: const Text("Select from gallery"),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                selectImage(ImageSource.camera);
              },
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take a photo"),
            )
          ]),
        );
      },
    );
  }

  void checkvalues() {
    String fullname = fullnamecontroller.text.trim();

    if (fullname == " ") {
      print("fill all the data");
    } else {
      uploadData();
    }
  }

  void uploadData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[500],
        title: const Text("Complete Profile"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ListView(children: [
          CupertinoButton(
            onPressed: () {
              showPhotoOption();
            },
            child: CircleAvatar(
              backgroundImage: getimage(),
              radius: 60,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: fullnamecontroller,
            decoration: InputDecoration(
              labelText: "Full Name",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CupertinoButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ));
            },
            color: Colors.blue[500],
            child: const Text("submit"),
          )
        ]),
      )),
    );
  }

  ImageProvider getimage() {
    if (imageFile == null) {
      return const AssetImage("assets/images/splas.jpg");
    } else {
      return FileImage(imageFile!);
    }
  }
}
