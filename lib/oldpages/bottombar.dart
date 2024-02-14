import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/widgets/api.dart';

class MyNavibar extends StatelessWidget {
  const MyNavibar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 400,
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Positioned(
        bottom: 5,
        left: 5,
        right: 5,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(2),
            topRight: Radius.circular(2),
            bottomLeft: Radius.circular(2),
            bottomRight: Radius.circular(2),
          ),
          child: Container(
            //color: Colors.amber,
            height: 30,
            //width: 100,
            padding: const EdgeInsets.only(
              left: 2,
              right: 2,
            ), // Adjusted bottom padding
            decoration: const BoxDecoration(
              color: Colors.blue,
              border: Border(
                  // top: BorderSide(
                  //     color: Colors.blue,
                  //     ),
                  ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amberAccent,
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        sendSOS();
                        Navigator.pushNamed(context, MyRoutes.sosRoute);
                      },
                      child: const Text(
                        "SOS",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.homeRoutes);
                  },
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.grey,
                      ),
                      Text("HOME"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Notification page
                  },
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.grey,
                      ),
                      Text("Notifications"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.drawerRoute);
                  },
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                      Text("Settings"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
