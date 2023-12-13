// ignore_for_file: unused_import

import 'package:flutter/material.dart';
//import 'package:flutter_application_udaantfr/pages/EventsPage.dart';
//import 'package:flutter_application_udaantfr/pages/bottombar.dart';
//import 'package:flutter_application_udaantfr/utils/MyRoutes.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_application_udaantfr/widgets/MyDrawer.dart';
import 'package:mapbox_turn_by_turn/oldpages/EventsPage.dart';
import 'package:mapbox_turn_by_turn/oldpages/bottombar.dart';
import 'package:mapbox_turn_by_turn/oldpages/nav_bar.dart';
import 'package:mapbox_turn_by_turn/oldpages/nav_model.dart';
import 'package:mapbox_turn_by_turn/oldpages/signuppage.dart';
import 'package:mapbox_turn_by_turn/oldpages/homepage.dart';
import 'package:mapbox_turn_by_turn/screens/profile_per.dart';
import 'package:mapbox_turn_by_turn/widgets/MyDrawer.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/widgets/api.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final homeNavKey = GlobalKey<NavigatorState>();

  final searchNavKey = GlobalKey<NavigatorState>();

  final notificationNavKey = GlobalKey<NavigatorState>();

  final profileNavKey = GlobalKey<NavigatorState>();
  // final username =
  // ModalRoute.of(context)!.settings.arguments as String;
  //String? username;

  int selectedTab = 0;

  List<NavModel> items = [];
  //final username = ModalRoute.of(context)!.settings.arguments as String;
  @override
  void initState() {
    super.initState();
    items = [
      NavModel(
        page: const TabPage(tab: 1),
        navKey: homeNavKey,
      ),
      NavModel(
        page: const TabPage(tab: 2),
        navKey: searchNavKey,
      ),
      NavModel(
        page: const TabPage(tab: 3),
        navKey: notificationNavKey,
      ),
      NavModel(
        page: const TabPage(tab: 4),
        navKey: profileNavKey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(96, 50, 10, 134),
        ),
        backgroundColor: Colors.blue,
        title: const Text('Home Page'),
        actions: [
          GestureDetector(
            onTap: () {
              //Profile page not created yet
              //Navigator.push(context, ProfileScreen());
              Navigator.pushNamed(context, MyRoutes.profileRoute);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ProfileScreen(username: username),
              //   ),
              // );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: Transform.scale(
                  scale: 1.5,
                  child: const Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(children: [
        Container(
          height: 150,
          width: double.infinity,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20.0),
          child: Image.asset(
            "assets/image/logo_ncc.png",
            height: 150,
            width: double.infinity,
            //alignment: Alignment.center,
          ),
        ),
        const SizedBox(height: 50.0),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.eventsRoutes);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'EVENTS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 64,
        width: 64,
        child: FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 0,
            //onPressed: () => debugPrint("Add Button pressed"),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.sosRoute);
            },
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Text(
              "SOS",
              style: TextStyle(color: Colors.black),
            )),
      ),
      bottomNavigationBar: NavBar(
        pageIndex: selectedTab,
        onTap: (index) {
          if (index == selectedTab) {
            items[index]
                .navKey
                .currentState
                ?.popUntil((route) => route.isFirst);
          } else {
            setState(() {
              selectedTab = index;
            });
          }
        },
      ),
    );
  }
}
