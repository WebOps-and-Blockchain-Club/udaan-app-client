import 'package:flutter/material.dart';
//import 'package:otp_text_field/otp_field.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
//import '';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);
  //tDefa
  //var tDefaultSize = 10;
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
                onSubmit: (code) => print("OTP is => $code")),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
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
