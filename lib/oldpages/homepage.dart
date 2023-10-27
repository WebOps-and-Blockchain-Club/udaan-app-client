// ignore_for_file: unused_import

import 'package:flutter/material.dart';
//import 'package:flutter_application_udaantfr/pages/EventsPage.dart';
//import 'package:flutter_application_udaantfr/pages/bottombar.dart';
//import 'package:flutter_application_udaantfr/utils/MyRoutes.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_application_udaantfr/widgets/MyDrawer.dart';
import 'package:mapbox_turn_by_turn/oldpages/EventsPage.dart';
import 'package:mapbox_turn_by_turn/oldpages/bottombar.dart';
import 'package:mapbox_turn_by_turn/oldpages/signuppage.dart';
import 'package:mapbox_turn_by_turn/oldpages/homepage.dart';
import 'package:mapbox_turn_by_turn/widgets/MyDrawer.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/widgets/api.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Home Page'),
        actions: [
          GestureDetector(
            onTap: () {
              //Profile page not created yet
              Navigator.pushNamed(context, MyRoutes.signinRoutes);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: Transform.scale(
                  scale: 1.8,
                  child: const Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.blue,
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
      bottomNavigationBar: const MyNavibar(),
    );
  }
}
