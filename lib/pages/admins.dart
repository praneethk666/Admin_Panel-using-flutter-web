import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_web/models/admin_model.dart';

class AdminsPage extends StatefulWidget {
  const AdminsPage({Key? key}) : super(key: key);

  @override
  State<AdminsPage> createState() => _AdminsPageState();
}

class _AdminsPageState extends State<AdminsPage> {
  AdminModel? _adminModel;
  List<AdminModel> _Admins = List.empty(growable: true); // = []
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 232, 228),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "ADMINS",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                scrollable: true,
                                elevation: 3,
                                title: const Text("ADD ADMIN"),
                                content: Form(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: TextFormField(
                                            controller: firstNameController,
                                            validator: (val) => (val!.isEmpty
                                                ? 'this field is required'
                                                : null),

                                            // onSaved: (val) => setState(() {
                                            //   _adminModel!.firstName = val!;
                                            // }),
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: "First Name",
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: TextFormField(
                                            controller: lastNameController,
                                            validator: (val) => (val!.isEmpty
                                                ? 'this field is required'
                                                : null),
                                            // onSaved: (val) => setState(() {
                                            //   _adminModel!.lastName = val!;
                                            // }),
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: "Last Name"),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: TextFormField(
                                            controller: emailController,
                                            validator: (val) => (val!.isEmpty
                                                ? 'this field is required'
                                                : null),
                                            // onSaved: (val) => setState(() {
                                            //   _adminModel!.email = val!;
                                            // }),
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: "Email"),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: TextFormField(
                                            controller: passController,
                                            validator: (val) => (val!.isEmpty
                                                ? 'this field is required'
                                                : null),
                                            // onSaved: (val) => setState(() {
                                            //   _adminModel!.password = val!;
                                            // }),
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: "Password"),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: TextFormField(
                                            controller: phoneController,
                                            validator: (val) => (val!.isEmpty
                                                ? 'this field is required'
                                                : null),
                                            // onSaved: (val) => setState(() {
                                            //   _adminModel!.phone = val!;
                                            // }),
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: "Phone"),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("CANCEL")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  var form =
                                                      _formKey.currentState;
                                                  if (form!.validate()) {
                                                    setState(() {
                                                      _Admins.add(AdminModel(
                                                          firstName:
                                                              firstNameController
                                                                  .text,
                                                          lastName:
                                                              lastNameController
                                                                  .text,
                                                          email: emailController
                                                              .text,
                                                          password:
                                                              passController
                                                                  .text,
                                                          phone: phoneController
                                                              .text));
                                                      firstNameController.text =
                                                          "";
                                                      lastNameController.text =
                                                          "";
                                                      emailController.text = "";
                                                      passController.text = "";
                                                      phoneController.text = "";
                                                    });
                                                  }
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("ADD")),
                                          ],
                                        ),
                                      ],
                                    )),
                              ));
                    },
                    child: const Text("ADD ADMIN"))
              ],
            ),
          ),
          //Divider(thickness: 1,color: Colors.black,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            //margin: EdgeInsets.all(20),
            color: Colors.black,
            child: ListTile(
              title: Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "First Name",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Last Name",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Email",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Phone",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  //SizedBox(width: 30,),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Actions",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _Admins.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text(
                      "No admins data found",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                )
              : Expanded(
                  child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView.builder(
                          itemCount: _Admins.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  title: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(_Admins[index].firstName),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(_Admins[index].lastName),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(_Admins[index].email),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(_Admins[index].phone),
                                        ),
                                      ),
                                      PopupMenuButton(
                                          padding: const EdgeInsets.all(8),
                                          itemBuilder: (context) {
                                            return [
                                              const PopupMenuItem<int>(
                                                value: 0,
                                                child: Text("Edit admin"),
                                              ),
                                              const PopupMenuItem<int>(
                                                value: 1,
                                                child: Text("Delete admin"),
                                              ),
                                            ];
                                          },
                                          onSelected: (value) {
                                            if (value == 0) {
                                              firstNameController.text =
                                                  _Admins[index].firstName;
                                              lastNameController.text =
                                                  _Admins[index].lastName;
                                              emailController.text =
                                                  _Admins[index].email;
                                              phoneController.text =
                                                  _Admins[index].phone;
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                            scrollable: true,
                                                            elevation: 3,
                                                            title: Text(
                                                                "EDIT ADMIN ${_Admins[index].firstName}"),
                                                            content: Form(
                                                                key: _formKey,
                                                                child: Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          bottom:
                                                                              20),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            firstNameController,
                                                                        validator: (val) => (val!.isEmpty
                                                                            ? 'this field is required'
                                                                            : null),

                                                                        // onSaved: (val) => setState(() {
                                                                        //   _adminModel!.firstName = val!;
                                                                        // }),
                                                                        decoration:
                                                                            const InputDecoration(
                                                                          border:
                                                                              OutlineInputBorder(),
                                                                          labelText:
                                                                              "First Name",
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          bottom:
                                                                              20),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            lastNameController,
                                                                        validator: (val) => (val!.isEmpty
                                                                            ? 'this field is required'
                                                                            : null),
                                                                        // onSaved: (val) => setState(() {
                                                                        //   _adminModel!.lastName = val!;
                                                                        // }),
                                                                        decoration: const InputDecoration(
                                                                            border:
                                                                                OutlineInputBorder(),
                                                                            labelText:
                                                                                "Last Name"),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          bottom:
                                                                              20),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            emailController,
                                                                        validator: (val) => (val!.isEmpty
                                                                            ? 'this field is required'
                                                                            : null),
                                                                        // onSaved: (val) => setState(() {
                                                                        //   _adminModel!.email = val!;
                                                                        // }),
                                                                        decoration: const InputDecoration(
                                                                            border:
                                                                                OutlineInputBorder(),
                                                                            labelText:
                                                                                "Email"),
                                                                      ),
                                                                    ),
                                                                    // Padding(
                                                                    //   padding: const EdgeInsets
                                                                    //           .only(
                                                                    //       bottom:
                                                                    //           20),
                                                                    //   child:
                                                                    //       TextFormField(
                                                                    //     controller:
                                                                    //         passController,
                                                                    //     validator: (val) => (val!.isEmpty
                                                                    //         ? 'this field is required'
                                                                    //         : null),
                                                                    //     // onSaved: (val) => setState(() {
                                                                    //     //   _adminModel!.password = val!;
                                                                    //     // }),
                                                                    //     decoration: const InputDecoration(
                                                                    //         border:
                                                                    //             OutlineInputBorder(),
                                                                    //         labelText:
                                                                    //             "Password"),
                                                                    //   ),
                                                                    // ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          bottom:
                                                                              20),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            phoneController,
                                                                        validator: (val) => (val!.isEmpty
                                                                            ? 'this field is required'
                                                                            : null),
                                                                        // onSaved: (val) => setState(() {
                                                                        //   _adminModel!.phone = val!;
                                                                        // }),
                                                                        decoration: const InputDecoration(
                                                                            border:
                                                                                OutlineInputBorder(),
                                                                            labelText:
                                                                                "Phone"),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                const Text("CANCEL")),
                                                                        ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              var form = _formKey.currentState;
                                                                              if (form!.validate()) {
                                                                                setState(() {
                                                                                  _Admins[index].firstName = firstNameController.text;
                                                                                  _Admins[index].lastName = lastNameController.text;
                                                                                  _Admins[index].email = emailController.text;
                                                                                  _Admins[index].phone = phoneController.text;

                                                                                  firstNameController.text = "";
                                                                                  lastNameController.text = "";
                                                                                  emailController.text = "";

                                                                                  phoneController.text = "";
                                                                                });
                                                                              }
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child:
                                                                                const Text("UPDATE")),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                )),
                                                          ));
                                            } else if (value == 1) {
                                              setState(() {
                                                _Admins.removeAt(index);
                                              });
                                            }
                                          })
                                    ],
                                  ),
                                ),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                )
                              ],
                            );
                          }))),
        ],
      ),
    );
  }
}
