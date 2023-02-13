import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String mail = "";
  String password = "";
  allowLogin() async {
    SnackBar snackBar = const SnackBar(
      content: Text(
        ""
        "Checking login details",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black87,
        ),
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    User? currentAdmin;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail, password: password)
        .then((fAuth) {
      currentAdmin = fAuth.user;
    }).catchError((onError) {
      final snackBar = SnackBar(
        content: Text(
          "Error occured$onError",
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    if (currentAdmin != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(currentAdmin!.uid)
          .get()
          .then((snap) {
        if (snap.exists) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Main();
              },
            ),
          );
        } else {
          SnackBar snackBar = const SnackBar(
            content: Text(
              ""
              "No account found",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
              ),
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 4),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          child: SizedBox(
              height: 412,
              width: 600,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 20),
                    child: Icon(size: 45, Icons.lock_outline),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Admin Login",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 35),
                    child: TextField(
                      onChanged: (value) {
                        mail = value;
                      },
                      controller: emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Email"),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 35),
                    child: TextField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      controller: passController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Password"),
                    ),
                  ),
                  SizedBox(
                      height: 36,
                      width: 560,
                      child: ElevatedButton(
                          onPressed: () {
                            allowLogin();
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 5, primary: const Color(0xFF9C27B0)),
                          child: const Text("SIGN IN")))
                ],
              )),
        ),
      ),
    );
  }
}
