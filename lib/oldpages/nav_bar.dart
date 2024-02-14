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
      child: BottomAppBar(
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Column(
            children: [
              SizedBox(width: screenWidth, height: 2,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, -3)
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    navItem(
                      Icons.home_outlined,
                      pageIndex == 0,
                      "Home",
                      onTap: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoutes);
                      },
                    ),
                    navItem(
                      Icons.message_outlined,
                      pageIndex == 1,
                      "Events",
                      onTap: () => onTap(1)
                    ),
                    // const SizedBox(width: 80),
                    navItem(
                      Icons.notifications_none_outlined,
                      pageIndex == 2,
                      "Settings",
                      onTap: () {
                        // Navigator.pushNamed(context, MyRoutes.homeRoutes);
                      },
                    ),
                    navItem(
                      Icons.person_outline,
                      pageIndex == 3,
                      "Profile",
                      onTap: () => onTap(3),
                    ),
                  ],
                ),
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
              size: 34,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
