import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';

// class MyDrawer extends StatelessWidget {
//   const MyDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const imageUrl = "lib/assets/Events1.jpg";
//     return Drawer(
//       child: Container(
//         color: const Color.fromARGB(222, 7, 96, 138),
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//                 padding: EdgeInsets.zero,
//                 margin: EdgeInsets.zero,
//                 child: UserAccountsDrawerHeader(
//                   accountName: Text("Abhishek D"),
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(222, 7, 96, 138),
//                   ),
//                   accountEmail: Text("abhi@gmail.com"),
//                   margin: EdgeInsets.zero,
//                   currentAccountPicture: CircleAvatar(
//                     backgroundImage: AssetImage(imageUrl),
//                   ),
//                 )),
//             ListTile(
//               onTap: () => {Navigator.pushNamed(context, MyRoutes.homeRoutes)},
//               leading: Transform.scale(
//                 scale: 1.5,
//                 child: const Icon(
//                   CupertinoIcons.home,
//                   color: Colors.white,
//                 ),
//               ),
//               title: const Text(
//                 "Home",
//                 // textScaler: TextScaler.linear(1.2),
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             ListTile(
//               onTap: () =>
//                   {Navigator.pushNamed(context, MyRoutes.signinRoutes)},
//               leading: Transform.scale(
//                 scale: 1.5,
//                 child: const Icon(
//                   CupertinoIcons.profile_circled,
//                   color: Colors.white,
//                 ),
//               ),
//               title: const Text(
//                 "Profile",
//                 // textScaler: TextScaler.linear(1.2),
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Transform.scale(
//                 scale: 1.5,
//                 child: const Icon(
//                   CupertinoIcons.mail,
//                   color: Colors.white,
//                 ),
//               ),
//               title: const Text(
//                 "Mail",
//                 // textScaler: TextScaler.linear(1.2),
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Your App Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Version 1.0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              // Handle the tap on Profile
              Navigator.pop(context);
              // Add logic to navigate to the profile screen
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle the tap on Home
              Navigator.pop(context);
              // Add logic to navigate to the home screen
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle the tap on Settings
              Navigator.pop(context);
              // Add logic to navigate to the settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Events'),
            onTap: () {
              // Handle the tap on Events
              Navigator.pop(context);
              // Add logic to navigate to the events screen
            },
          ),
          // Add more ListTiles for additional menu items
        ],
      ),
    );
  }
}
