
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 3,
          ),
        ],
      ),
      child: BottomAppBar(
        color: Colors.white,
        height: 65,
        padding: EdgeInsets.only(
          top: 7
        ),
        elevation: 0.0,
        child: Container(
          color: Colors.red,
          child: Row(
            children: [
              navItem(
                Icons.home,
                pageIndex == 0,
                "Home",
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.homeRoutes);
                },
              ),
              navItem(
                  Icons.event,
                  pageIndex == 1,
                  "Events",
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.eventsRoutes);
                  }
              ),
              const SizedBox(width: 50),
              navItem(
                Icons.settings,
                pageIndex == 2,
                "Settings",
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.profileRoutes);
                },
              ),
              navItem(
                Icons.person,
                pageIndex == 3,
                "Profile",
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.profileRoute);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, String title, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Icon(
              icon,
              color: selected ? Colors.green : Colors.grey.shade600,
              size: 36,
            ),
            Text(title,
            style: TextStyle(
              fontSize: 11
            ),)
          ],
        ),
      ),
    );
  }
}
