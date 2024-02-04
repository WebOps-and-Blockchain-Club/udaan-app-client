
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController messageController = TextEditingController();
  String defaultText = "There is an emergency, please help";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/indian-flag-2644512_1280.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Changed to start
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "PLEA FOR HELP",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 300.0),
                Container(
                  width: double.infinity, // Set to take the full width
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        controller: messageController,
                        style: const TextStyle(color: Colors.white),
                        maxLines: null,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: defaultText,
                          hintStyle: const TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 0),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String message = messageController.text.isEmpty
              ? defaultText
              : messageController.text;

          // Add functionality to send the message (e.g., print it for now)
          print("Message sent: $message");
        },
        child: const Icon(Icons.send),
        backgroundColor: Colors.black,
      ),
    );
  }

}
