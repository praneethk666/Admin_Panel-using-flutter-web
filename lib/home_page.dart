import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/login_page.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
     
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black,
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          alignment: Alignment.topRight,
                          actions: [
                            Center(
                              child: SizedBox(
                                  height: 30,
                                  width: 150,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        FirebaseAuth.instance.signOut();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const MyHomePage();
                                            },
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation: 5,
                                          primary: const Color(0xFF9C27B0)),
                                      child: const Text("SIGN OUT"))),
                            ),
                          ],
                        ));
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.supervised_user_circle_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "ADMIN 123",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
        elevation: 1,
        title: const Text(
          "Admin Panel",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 237, 237, 248),
      ),
       drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          NavigationRail(
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              groupAlignment: -1.0,
              labelType: NavigationRailLabelType.none,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: Text('First'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  selectedIcon: Icon(Icons.book),
                  label: Text('Second'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Third'),
                ),
              ],
              selectedIndex: _selectedIndex)
        ],
      ),
    );
  }
}
