import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
//import 'package:flutter_application_udaantfr/utils/MyRoutes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl = "lib/assets/Events1.jpg";
    return Drawer(
      child: Container(
        color: const Color.fromARGB(222, 7, 96, 138),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("Abhishek D"),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(222, 7, 96, 138),
                  ),
                  accountEmail: Text("abhi@gmail.com"),
                  margin: EdgeInsets.zero,
                  //currentAccountPicture: Image.network(imageUrl),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(imageUrl),
                  ),
                )),
            ListTile(
              onTap: () => {Navigator.pushNamed(context, MyRoutes.homeRoutes)},
              leading: Transform.scale(
                scale: 1.5,
                child: const Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () =>
                  {Navigator.pushNamed(context, MyRoutes.signinRoutes)},
              leading: Transform.scale(
                scale: 1.5,
                child: const Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Transform.scale(
                scale: 1.5,
                child: const Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Mail",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
