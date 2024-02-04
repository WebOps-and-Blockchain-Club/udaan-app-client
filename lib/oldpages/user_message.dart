<<<<<<< HEAD
// import 'package:flutter/material.dart';

// class MessagePage extends StatefulWidget {
//   @override
//   _MessagePageState createState() => _MessagePageState();
// }

// class _MessagePageState extends State<MessagePage> {
//   TextEditingController messageController = TextEditingController();
//   String defaultText = "There is an emergency, please help";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("Emergency Message"),
//       //   // backgroundColor: Colors.transparent,
//       // ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 "assets/image/indian-flag-2644512_1280.jpeg"), // Add your background image asset path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 80,
//                 // width: 180,
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: TextField(
//                   controller: messageController,
//                   textAlign: TextAlign.left,
//                   decoration: InputDecoration(
//                     hintText: defaultText,
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           String message = messageController.text.isEmpty
//               ? defaultText
//               : messageController.text;

//           // Add functionality to send the message (e.g., print it for now)
//           print("Message sent: $message");
//         },
//         child: Icon(Icons.send),
//         backgroundColor: Colors.blue,
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class MessagePage extends StatefulWidget {
//   @override
//   _MessagePageState createState() => _MessagePageState();
// }

// class _MessagePageState extends State<MessagePage> {
//   TextEditingController messageController = TextEditingController();
//   String defaultText = "There is an emergency, please help";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/image/indian-flag-2644512_1280.jpeg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "PLEA FOR HELP",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 Container(
//                   width: 160,
//                   child: Container(
//                     height: 80,
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: TextField(
//                       controller: messageController,
//                       style: TextStyle(color: Colors.white),
//                       textAlign: TextAlign.left,
//                       decoration: InputDecoration(
//                         hintText: defaultText,
//                         hintStyle: TextStyle(color: Colors.white),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           String message = messageController.text.isEmpty
//               ? defaultText
//               : messageController.text;

//           // Add functionality to send the message (e.g., print it for now)
//           print("Message sent: $message");
//         },
//         child: Icon(Icons.send),
//         backgroundColor: Colors.black,
//       ),
//     );
//   }
// }
=======
>>>>>>> ea90dc992d23954e3eac274e6f890a38c2bde6a5
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
<<<<<<< HEAD
                SizedBox(
                  height: 20,
                ),
                Text(
=======
                const SizedBox(
                  height: 20,
                ),
                const Text(
>>>>>>> ea90dc992d23954e3eac274e6f890a38c2bde6a5
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
<<<<<<< HEAD
                        style: TextStyle(color: Colors.white),
=======
                        style: const TextStyle(color: Colors.white),
>>>>>>> ea90dc992d23954e3eac274e6f890a38c2bde6a5
                        maxLines: null,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          hintText: defaultText,
<<<<<<< HEAD
                          hintStyle: TextStyle(color: Colors.white),
=======
                          hintStyle: const TextStyle(color: Colors.white),
>>>>>>> ea90dc992d23954e3eac274e6f890a38c2bde6a5
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
<<<<<<< HEAD
        child: Icon(Icons.send),
=======
        child: const Icon(Icons.send),
>>>>>>> ea90dc992d23954e3eac274e6f890a38c2bde6a5
        backgroundColor: Colors.black,
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> ea90dc992d23954e3eac274e6f890a38c2bde6a5
