import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:otp_text_field/otp_field.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
//import '';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  //tDefa
  String otp = "";

  @override
  Widget build(BuildContext context) {
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
              //style: Theme.of(context).textTheme.headline6,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 40.0),
            // const Text("support@codingwitht.com", textAlign: TextAlign.center),
            const SizedBox(height: 20.0),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 4,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              // onCodeChanged: (value) {
              //   otp = value;
              // },
              //onSubmit: (code) => print("OTP is => $code")
              onSubmit: (value) {
                otp = value;
              },
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    //await sendDataToApiotp(otp);
                    Navigator.pushNamed(context, MyRoutes.homeRoutes);
                  },
                  child: const Text('NEXT')),
            ),
            const Text(
              "Resend OTP",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

String ngroklink = '';
Future<void> sendDataToApiotp(String otp) async {
  print("Sending data to API: $otp");

  final apiUrl = '$ngroklink/api/v1/auth/varifyotp';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      // body: jsonEncode({
      //   'username': username,
      //   'password': password,
      //   'email': email,
      //   'coordinates': coordinate,
      //   'state': state,
      //   'city': city,
      // }),
      body: jsonEncode({
        'otp': otp,
      }),
    );

    if (response.statusCode == 200) {
      final data = response.body;
      print("Response data: $data");
      print('Successfully done');
    } else {
      final errorData = response.body;
      print("Error data: $errorData");
      throw Exception('Failed to send data to the API');
    }
  } catch (error) {
    print('Error: $error');
    //throw Exception('Failed to send data to the API');
  }
}
