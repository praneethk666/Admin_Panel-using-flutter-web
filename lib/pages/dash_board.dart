
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/firebase_controller.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);
  static FireBaseStorage controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FireBaseStorage>(
      builder: (storageController) {
        return ListView.builder(
            itemCount: controller.images.length,
            itemBuilder: (BuildContext context, index) {
              return Container(
                margin: const EdgeInsets.all(30),
                height: 100,
                width: 100,
                child: Image.network(storageController.images[index]),
              );
            });
      },
    );
  }
}
