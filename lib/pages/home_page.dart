import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/pages/admins.dart';
import 'package:flutter_web/dash_Board.dart';
import 'package:flutter_web/pages/favorites.dart';
import 'package:flutter_web/pages/login_page.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  Widget NavPages(){
      switch(_selectedIndex){
        case 0: 
        return DashBoard();
        case 1:
        return AdminsPage();
        case 2:
        return FavoritesPage();
        default:
        return DashBoard();
      }
    }
  
  int _selectedIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.5),
          child: IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
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
                children: const [
                   Padding(
                    padding: EdgeInsets.only(right: 5),
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
        backgroundColor: const Color.fromARGB(255, 237, 237, 248),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 237, 237, 248),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 0,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                child: Text('Drawer Header'),
              ),
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
          if(MediaQuery.of(context).size.width>=840)
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
                  icon: Icon(Icons.home),
                  selectedIcon: Icon(Icons.home_filled),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.admin_panel_settings_outlined),
                  selectedIcon: Icon(Icons.admin_panel_settings),
                  label: Text('Forms'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Favorite'),
                ),
              ],
              selectedIndex: _selectedIndex),
              const VerticalDivider(thickness: 1, width: 2),
              Expanded(child: NavPages()),
        ],
      ),
    );
    
  }
}
