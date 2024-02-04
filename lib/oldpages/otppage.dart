import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:otp_text_field/otp_field.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
//import '';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mapbox_turn_by_turn/oldpages/signuppage.dart';

// String emailFromSignInPage = email;
// final String emailFromSignInPag =
//       ModalRoute.of(BuildContext as BuildContext)!.settings.arguments as String;
class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.email});
  final String email;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  //tDefa
  String otp = "";
  @override
  Widget build(BuildContext context) {
    final String email = widget.email;
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
              onCodeChanged: (value) {
                otp = value;
              },
              //onSubmit: (code) => print("OTP is => $code")
              onSubmit: (value) {
                otp = value;
              },
            ),
            const SizedBox(height: 20.0),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //       onPressed: () async {
            //         // late var name = getDataFromLocalStorage("name");
            //         // late var password = getDataFromLocalStorage("password");
            //         // late var email = getDataFromLocalStorage("email");
            //         // late var coordinates =
            //         //     getDataFromLocalStorage("coordinates");
            //         // late var state = getDataFromLocalStorage("state");
            //         // late var city = getDataFromLocalStorage("city");
            //         // late var role = getDataFromLocalStorage("role");
            //         // var data = {
            //         //   "name": name,
            //         //   "password": password,
            //         //   "email": email,
            //         //   "coordinates": coordinates,
            //         //   "state": state,
            //         //   "city": city,
            //         //   "role": role,
            //         // };
            //         print(
            //             "its working------------------------------------------------------------");
            //         //print(data);

            //         await sendDataToApiotp(emailFromSignInPage, otp);
            //         Navigator.pushNamed(context, MyRoutes.homeRoutes);
            //       },
            //       child: const Text('NEXT')),
            // ),
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
                      // late var name = getDataFromLocalStorage("name");
                      // late var password = getDataFromLocalStorage("password");
                      // late var email = getDataFromLocalStorage("email");
                      // late var coordinates =
                      //     getDataFromLocalStorage("coordinates");
                      // late var state = getDataFromLocalStorage("state");
                      // late var city = getDataFromLocalStorage("city");
                      // late var role = getDataFromLocalStorage("role");
                      // var data = {
                      //   "name": name,
                      //   "password": password,
                      //   "email": email,
                      //   "coordinates": coordinates,
                      //   "state": state,
                      //   "city": city,
                      //   "role": role,
                      // };
                      print(
                          "its working------------------------------------------------------------");
                      //print(data);

                      await sendDataToApiotp(email, otp);
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

// String ngroklink = 'http://ec2-15-206-81-114.ap-south-1.compute.amazonaws.com';
String ngroklink = 'https://7f6a-103-158-43-46.ngrok-free.app';

Future<void> sendDataToApiotp(String email, String otp) async {
  print("Sending data to API: $otp");
  //print(Type)
  print("Type: ${email.runtimeType}");

  final apiUrl = '$ngroklink/api/v1/auth/verifyotp';

  try {
    final prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('user');
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

      body: jsonEncode({'email': email, 'otp': otp, 'user': user}),
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
    throw Exception('Failed to send data to the API');
  }
}
