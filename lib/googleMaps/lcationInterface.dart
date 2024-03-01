// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//     locationPermission();
//   }

//   Location location = new Location();
//   late LocationData _locationData;
//   String lati = "";
//   String long = "";

//   void locationPermission() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }

//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//   }

//   int _counter = 0;
//   late IO.Socket socket;
//   var _isConnected = false;

//   void _connect() async {
//     socket = IO.io(
//         "https://7114-103-158-43-46.ngrok-free.app",
//         IO.OptionBuilder()
//             .setTransports(['websocket']) // for Flutter or Dart VM
//             .disableAutoConnect() // disable auto-connection
//             .build());
//     socket.connect();

//     print(socket.connected);

//     socket.onConnect((_) {
//       print("connect");
//       _isConnected = true;
//     });
//     socket.onConnectError((data) {
//       print("Connection Error ${data}");
//     });
//   }

//   void disconnect() {
//     if (_isConnected) {
//       socket.disconnect();
//       socket.onDisconnect((data) {
//         _isConnected = false;
//         print("Disconnected");
//       });
//     }
//   }

//   void _showLocation() async {
//     _locationData = await location.getLocation();
//     var msg = {
//       "fromId": "1",
//       "toId": "2",
//       "cordinates": {
//         "lat": "${_locationData.latitude}",
//         "long": "${_locationData.longitude}"
//       }
//     };
//     setState(() {
//       long = _locationData.longitude.toString();
//       lati = _locationData.latitude.toString();
//     });
//     socket.emit('sos', jsonEncode(msg.toString()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'your Location is : long = $long  lati= $lati ',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             ElevatedButton(
//                 onPressed: disconnect, child: const Icon(Icons.cancel)),
//             const SizedBox(
//               height: 40,
//             ),
//             ElevatedButton(
//                 onPressed: _showLocation, child: const Icon(Icons.update))
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _connect,
//         tooltip: 'Connect to Person',
//         child: const Icon(Icons.private_connectivity_outlined),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(const MyChatApp());
}

class MyChatApp extends StatelessWidget {
  const MyChatApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyChatPage(),
    );
  }
}

class MyChatPage extends StatefulWidget {
  const MyChatPage({super.key});

  @override
  State<MyChatPage> createState() => _MyChatPageState();
}

class _MyChatPageState extends State<MyChatPage> {
  List<String> messages = [
    "Hello!",
    "How are you?",
    "I'm doing well, thanks!",
  ];

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Application"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageWidget(message: messages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration:const  InputDecoration(
                      hintText: "Type a message...",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage() {
    String message = messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message);
        messageController.clear();
      });
    }
  }
}

class MessageWidget extends StatelessWidget {
  final String message;

  const MessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding:const  EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}