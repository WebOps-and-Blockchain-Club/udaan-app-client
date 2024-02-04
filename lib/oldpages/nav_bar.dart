import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: Platform.isAndroid ? 8 : 0,
      ),
      child: BottomAppBar(
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60,
            color: Colors.blue,
            child: Row(
              children: [
                navItem(
                  Icons.home_outlined,
                  pageIndex == 0,
                  // onTap: () => onTap(
                  //   Navigator.pushNamed(context, MyRoutes.homeRoutes);
                  //   ),
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.homeRoutes);
                  },
                ),
                navItem(
                  Icons.message_outlined,
                  pageIndex == 1,
                  onTap: () => onTap(1),
                ),
                const SizedBox(width: 80),
                navItem(
                  Icons.notifications_none_outlined,
                  pageIndex == 2,
                  onTap: () {
                    // Navigator.pushNamed(context, MyRoutes.homeRoutes);
                  },
                ),
                navItem(
                  Icons.person_outline,
                  pageIndex == 3,
                  onTap: () => onTap(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: selected ? Colors.white : Colors.white.withOpacity(0.4),
        ),
      ),
    );
  }
}
