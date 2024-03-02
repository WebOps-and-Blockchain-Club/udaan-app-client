import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(12.0),
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
