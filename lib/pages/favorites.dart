// ignore_for_file: avoid_print

import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/firebase_controller.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final _picker = ImagePicker();
  static FireBaseStorage controller = Get.find();
  bool pickedImage = false;
  String filename = "";
  String? picc;


  // //var croppedImage;
  Uint8List? webImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(115, 250, 182, 182),
      body: Column(
        children: [
          pickedImage == false
              ? Container(
                  margin: const EdgeInsets.all(30),
                  height: 300,
                  width: 300,
                  color: const Color.fromARGB(115, 130, 130, 130),
                )
              : Container(
                  margin: const EdgeInsets.all(30),
                  height: 300,
                  width: 300,
                  child: Image.memory(
                    webImage!,
                    fit: BoxFit.contain,
                  ),
                ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();
                  if (result != null) {
                    setState(() {
                      webImage = result.files.first.bytes;
                      pickedImage = true;
                      filename = result.files.first.name;
                    });
                  }
                  await FirebaseStorage.instance
                      .ref('adminpanel/$filename')
                      .putData(webImage!);
                  var url = await FirebaseStorage.instance
                      .ref('adminpanel/$filename')
                      .getDownloadURL();

                  controller.updateList(url);
                },
                child: const Text("Upload")),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
                onPressed: () async {
                  XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                      webImage = await image.readAsBytes();
                      filename = image.path;
                      pickedImage = true;
                      

                    
                  } else {
                    print("error");
                  }
                },
                child: const Text("Select Image"))
          ]),
         
        ],
      ),
    );
  }
}
