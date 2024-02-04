
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
// import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:shared_preferences/shared_preferences.dart';

String ngroklink = 'http://43.204.145.3:8000';

//  final prefs = await SharedPreferences.getInstance();
Future<void> sendDataToApi(
    String email, String password, String coordinates) async {
  print(
      "Sending data to API: username=$email, password=$password, coordinates=$coordinates");

  final apiUrl = '$ngroklink/api/v1/auth/login';
  final prefs = await SharedPreferences.getInstance();
  try {
    print("hii");
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
        'coordinates': coordinates,
      }),
      //body: jsonEncode(<String, String>{"email": "HH", "password": "HH1"}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      await prefs.setString('auth-token', data['accessToken'] ?? "");
      var auth = prefs.getString('auth-token');
    } else {
      final errorData = json.decode(response.body);
      print("Error data: $errorData");
      throw Exception('Failed to send data to the API');
    }
  } catch (error) {
    print('Error: $error');
    throw Exception('Failed to send data to the API');
  }
}

Future<void> sendDataToApi1(
  String email,
) async {
  print("Sending data to API: username=, password=, email=$email, address= ");

  final apiUrl = '$ngroklink/api/v1/auth/register';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
      }),
    );
    print(response);
    if (response.statusCode == 200) {
      final data = response.body;
      print(data.runtimeType);
      data.toString;
      print("Response dagfhngfhngfta: $data");
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



Future<void> _storing() async {
  print("sos");
}

Future<void> sendSOS() async {
  print("calling sos route");

  final apiUrl = '$ngroklink/api/v1/sos/notifycadets';
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('auth-token') ?? "";
  print(token);
  try {
    print("hii");
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json', 'auth-token': token},
    );
    print(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      String token = data.accessToken;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token) ?? "";

      //Save the token to local storagee
      // response.headers.addAll
      print("Response data: $data");
      print('Successfully done');
    } else {
      final errorData = json.decode(response.body);
      print("Error data: $errorData LAUDE");
      throw Exception('Failed to send data to the API');
    }
  } catch (error) {
    print('Error: $error');
    throw Exception('Failed to send data to the API');
  }
}
