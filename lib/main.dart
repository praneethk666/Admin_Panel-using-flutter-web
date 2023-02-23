import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/controllers/bindings.dart';
import 'package:flutter_web/pages/home_page.dart';
import 'package:flutter_web/pages/login_page.dart';
import 'package:get/get.dart';

import 'config.dart';
final auth = FirebaseAuth.instance;
final configurations = Configurations();
Future<void> main() async {
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: configurations.apiKey,
          appId: configurations.appId,
          messagingSenderId: configurations.messagingSenderId,
          projectId: configurations.projectId,
          storageBucket: "authentication-bf21b.appspot.com",)
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null?const MyHomePage():const Main(),
      initialBinding: InitialBindings(),
    );
  }
}

