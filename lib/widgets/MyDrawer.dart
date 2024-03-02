import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';

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
                // accountName: Text("Abhishek D"),
                accountName: Text("UDAAN"),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(89, 158, 133, 1),
                ),
                // accountEmail: Text("abhi@gmail.com"),
                accountEmail: Text("The First Responder"),
                margin: EdgeInsets.zero,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    imageUrl,
                  ),
                  radius: 40,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            _buildExpansionTileWithoutTrailingIcon(
              icon: CupertinoIcons.home,
              title: "Home",
              Routes: MyRoutes.profileRoute,
            ), // Add spacing
            _buildExpansionTileWithoutTrailingIcon(
                icon: CupertinoIcons.mail,
                title: "Mail",
                Routes: MyRoutes.profileRoute),
            _buildExpansionTileWithoutTrailingIcon(
                icon: CupertinoIcons.profile_circled,
                title: "PROFILE",
                Routes: MyRoutes.profileRoute),
            _buildExpansionTileWithoutTrailingIcon(
                icon: CupertinoIcons.settings_solid,
                title: "Settings",
                Routes: MyRoutes.profileRoute),
            _buildExpansionTile(
              icon: Icons.event,
              title: "Events",
              children: [
                _buildDrawerItem(
                  icon: CupertinoIcons.ellipsis_vertical_circle,
                  title: "Current Events",
                  route: MyRoutes.eventsRoutes,
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
        side: BorderSide(color:  Color.fromRGBO(89, 158, 133, 1), width: 2.0),
      ),
      color: Colors.white,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        leading: Icon(
          icon,
          color: Color.fromRGBO(89, 158, 133, 1),
          size: 30,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(89, 158, 133, 1),
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
    bool hasTrailingIcon = title == "Home" || title == "Events";
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Color.fromRGBO(89, 158, 133, 1), width: 2.0),
      ),
      color: Colors.white,
      child: ExpansionTile(
        leading: Icon(
          icon,
          color: Color.fromRGBO(89, 158, 133, 1),
          size: 30,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(89, 158, 133, 1),
            fontSize: 18,
          ),
        ),
        children: children,
        trailing: hasTrailingIcon
            ? const Icon(Icons.keyboard_arrow_down,
            color: Color.fromRGBO(89, 158, 133, 1), size: 24)
            : null,
      ),
    );
  }
  Widget _buildExpansionTileWithoutTrailingIcon({
    required IconData icon,
    required String title,
    required String Routes,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Color.fromRGBO(89, 158, 133, 1), width: 2.0),
      ),
      color: Colors.white,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, Routes);
        },
        leading: Icon(
          icon,
          color: Color.fromRGBO(89, 158, 133, 1),
          size: 30,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(89, 158, 133, 1),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}