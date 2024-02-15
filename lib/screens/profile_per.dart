import 'package:flutter/material.dart';

import '../oldpages/nav_bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(username: 'Gandu Dikshant'),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  final String username;
  const ProfileScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.35,
            width: screenWidth,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    height: screenHeight * 0.25,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1.3,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.25 - 75,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth),
                      image: const DecorationImage(
                          image: AssetImage('assets/image/person.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                itemProfile('Name', widget.username, Icons.person),
                const SizedBox(height: 10),
                itemProfile('Phone', '9646071964', Icons.phone),
                const SizedBox(height: 10),
                itemProfile('Address', 'Rich Palace, Bhatinda, Punjab',
                    Icons.location_city),
                const SizedBox(height: 10),
                itemProfile('Email', 'develoferDikshant@gmail.com',
                    Icons.mail),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget itemProfile(String title, String subtitle, IconData iconData) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 2),
          color: Colors.blue.withOpacity(.1),
          spreadRadius: 2,
          blurRadius: 5,
        )
      ],
    ),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(iconData),
      trailing: const Icon(Icons.edit, color: Colors.grey),
    ),
  );
}
