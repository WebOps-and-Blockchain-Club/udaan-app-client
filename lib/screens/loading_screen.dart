import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/screens/turn_by_turn.dart';

class Screen_load extends StatefulWidget {
  const Screen_load({Key? key}) : super(key: key);

  @override
  State<Screen_load> createState() => _Screen_loadState();
}

class _Screen_loadState extends State<Screen_load> {
  @override
  void initState() {
    super.initState();
    // Delay for 7 seconds and then navigate to 'abhishek' page
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const TurnByTurn()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(), // You can use any loading indicator widget here
      ),
    );
  }
}
