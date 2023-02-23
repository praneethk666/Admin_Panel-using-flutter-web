
import 'package:get/get.dart';

import 'firebase_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<FireBaseStorage>(
      FireBaseStorage(),
      permanent: true,
    );
    
}}