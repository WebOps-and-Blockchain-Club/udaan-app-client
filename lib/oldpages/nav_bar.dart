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
      // height: 20,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: BottomAppBar(
        // height: 18,
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Container(
            // height: 18,
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
                  onTap: () => onTap(1)
                ),
                const SizedBox(width: 20),
                navItem(
                  Icons.settings,
                  pageIndex == 2,
                  "Settings",
                  onTap: () {
                    // Navigator.pushNamed(context, MyRoutes.homeRoutes);
                  },
                ),
                navItem(
                  Icons.person,
                  pageIndex == 3,
                  "Profile",
                  onTap: () => onTap(3),
                ),
              ],
            ),
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
              size: 24,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
