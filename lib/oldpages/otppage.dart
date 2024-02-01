import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    super.key,
    required this.email,
    required this.username,
    required this.password,
    required this.coordinates,
    required this.state,
    required this.role,
    required this.isAvailable,
    required this.city,
    required this.fcmToken,
  });
  final String email;
  final String username;
  final String password;
  final String state;
  final String role;
  final String city;
  final String fcmToken;
  final bool isAvailable;
  final Object coordinates;
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String otp = "";
  @override
  Widget build(BuildContext context) {
    final String email = widget.email;
    final String username = widget.username;
    final String password = widget.password;
    final String state = widget.state;
    final String role = widget.role;
    final String city = widget.city;
    final String fcmToken = widget.fcmToken;
    final bool isAvailable = widget.isAvailable;
    final Object coordinates = widget.coordinates;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'VERIFY',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 60.0),
            ),
            Text(
              'OTP'.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 40.0),
            const SizedBox(height: 20.0),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 4,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onCodeChanged: (value) {
                otp = value;
              },
              //onSubmit: (code) => print("OTP is => $code")
              onSubmit: (value) {
                otp = value;
              },
            ),
            const SizedBox(height: 20.0),
            const Column(
              children: [
                Row(
                  children: [
                    Text(
                      "           If you didn't receive the code  ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      " Resend ",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              //width: double.infinity,
              child: Container(
                height: 45,
                width: 200,
                child: ElevatedButton(
                    onPressed: () async {
                      print(
                          "its working------------------------------------------------------------");

                      await sendDataToApiotp(
                          email,
                          otp,
                          username,
                          password,
                          "123456 4567890",
                          state,
                          role,
                          isAvailable,
                          city,
                          fcmToken);
                      Navigator.pushNamed(context, MyRoutes.signinRoutes);
                    },
                    child: const Text('NEXT')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String?> getDataFromLocalStorage(String key) async {
  final prefs = await SharedPreferences.getInstance();
  var data = prefs.getString(key);
  return data;
  // print(data);
  // return data;
}

// String ngroklink = 'https://e8f1-103-158-43-46.ngrok-free.app';

Future<void> sendDataToApiotp(
    String email,
    String otp,
    String username,
    String password,
    String coordinates,
    String state,
    String role,
    bool isAvailable,
    String city,
    String fcmToken) async {
  print("Sending data to API: $otp");
  //print(Type)
  print("Type: ${email.runtimeType}");

  final apiUrl = '$ngroklink/api/v1/auth/verifyotp';
  final prefs = await SharedPreferences.getInstance();

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'otp': otp,
        'username': username,
        'password': password,
        'coordinates': "1234567 123456789",
        'state': state,
        'city': city,
        'role': role,
        'isAvailable': isAvailable,
        'fcmToken': fcmToken,
      }),
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      await prefs.setString('auth-token', data['accessToken'] ?? "");
      var auth = prefs.getString('auth-token');
      print(auth);
    } else {
      final errorData = response.body;
      print("Error data: $errorData");
      throw Exception('Failed to send data to the API');
    }
  } catch (error) {
    print('Error: $error');
    throw Exception('Failed to send data to the API');
  }
}
