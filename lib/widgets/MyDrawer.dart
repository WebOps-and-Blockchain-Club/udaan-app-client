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

// class MyDrawer extends StatefulWidget {
//   const MyDrawer({Key? key}) : super(key: key);
//   @override
//   State<MyDrawer> createState() => _MyDrawerState();
// }

// class _MyDrawerState extends State<MyDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     const imageUrl = "lib/assets/Events1.jpg";
//     return Drawer(
//       child: Container(
//         color: Colors.white,
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               padding: EdgeInsets.zero,
//               margin: EdgeInsets.zero,
//               child: UserAccountsDrawerHeader(
//                 accountName: Text("Abhishek D"),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                 ),
//                 accountEmail: Text("abhi@gmail.com"),
//                 margin: EdgeInsets.zero,
//                 currentAccountPicture: CircleAvatar(
//                   backgroundImage: AssetImage(imageUrl),
//                 ),
//               ),
//             ),
//             _buildDrawerItem(
//               icon: CupertinoIcons.home,
//               title: "Home",
//               route: MyRoutes.homeRoutes,
//             ),
//             _buildDrawerItem(
//               icon: CupertinoIcons.profile_circled,
//               title: "Profile",
//               route: MyRoutes.signinRoutes,
//             ),
//             _buildExpansionTile(
//               icon: CupertinoIcons.mail,
//               title: "Mail",
//               children: [
//                 _buildDrawerItem(
//                   icon: CupertinoIcons.ellipsis_vertical_circle,
//                   title: "Events",
//                   route: MyRoutes.eventsRoutes,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _buildDrawerItem({
//     required IconData icon,
//     required String title,
//     required String route,
//   }) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: ListTile(
//         onTap: () {
//           // Navigator.pushNamed(context, route);
//         },
//         leading: Icon(
//           icon,
//           color: Colors.blue,
//           size: 30,
//         ),
//         title: Text(
//           title,
//           style: TextStyle(
//             color: Colors.blue,
//             fontSize: 18,
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildExpansionTile({
//     required IconData icon,
//     required String title,
//     required List<Widget> children,
//   }) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: ExpansionTile(
//         leading: Icon(
//           icon,
//           color: Colors.blue,
//           size: 30,
//         ),
//         title: Text(
//           title,
//           style: const TextStyle(
//             color: Colors.blue,
//             fontSize: 18,
//           ),
//         ),
//         children: children,
//       ),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    const imageUrl = "assets/image/logo_ncc.png";
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Abhishek D"),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                accountEmail: Text("abhi@gmail.com"),
                margin: EdgeInsets.zero,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    imageUrl,
                  ),
                  radius: 40,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            _buildExpansionTile(
              icon: CupertinoIcons.home,
              title: "Home",
              children: [
                _buildDrawerItem(
                  icon: CupertinoIcons.ellipsis_vertical_circle,
                  title: "Home Events",
                  route: MyRoutes.homeRoutes,
                ),
              ],
            ),
            SizedBox(height: 0), // Add spacing
            _buildExpansionTile(
              icon: CupertinoIcons.mail,
              title: "Mail",
              children: [
                _buildDrawerItem(
                  icon: CupertinoIcons.ellipsis_vertical_circle,
                  title: "Mail Events",
                  route: MyRoutes.homeRoutes,
                ),
              ],
            ),
            SizedBox(
              height: 0,
            ),
            _buildExpansionTile(
              icon: CupertinoIcons.profile_circled,
              title: "PROFILE",
              children: [
                // _buildDrawerItem(
                //   icon: CupertinoIcons.ellipsis_vertical_circle,
                //   title: "Home Events",
                //   route: MyRoutes.homeRoutes,
                // ),
              ],
            ),
            SizedBox(height: 0), // Add spacing
            _buildExpansionTile(
              icon: CupertinoIcons.settings_solid,
              title: "Settings",
              children: [
                // _buildDrawerItem(
                //   icon: CupertinoIcons.ellipsis_vertical_circle,
                //   title: "Mail Events",
                //   route: MyRoutes.homeRoutes,
                // ),
              ],
            ),
            SizedBox(height: 0), // Add spacing
            _buildExpansionTile(
              icon: Icons.event,
              title: "Events",
              children: [
                _buildDrawerItem(
                  icon: CupertinoIcons.ellipsis_vertical_circle,
                  title: "Current Events",
                  route: MyRoutes.homeRoutes,
                ),
                _buildDrawerItem(
                  icon: CupertinoIcons.ellipsis_vertical_circle,
                  title: "Previous Events",
                  route: MyRoutes.homeRoutes,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required String route,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.blue, width: 2.0),
      ),
      color: Colors.white,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildExpansionTile({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Colors.blue, width: 2.0),
      ),
      color: Colors.white,
      child: ExpansionTile(
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 18,
          ),
        ),
        children: children,
        trailing:
            const Icon(Icons.keyboard_arrow_down, color: Colors.blue, size: 24),
      ),
    );
  }
}
