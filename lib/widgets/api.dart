// import 'package:http/http.dart' as http;

// Future<void> sendDataToApi(
//     String username, String password, String type) async {
//   const apiUrl = 'http://localhost:3000';

//   final response = await http.post(Uri.parse(apiUrl), body: {
//     'type': type,
//     'username': username,
//     'password': password,
//   });

//   if (response.statusCode == 200) {
//     print('successfully done');
//   } else {
//     // Handle errors if the API request fails
//     throw Exception('Failed to send data to the API');
//   }
// }

// Future<void> sendDataToApi1(
//     String username, String password, String email) async {
//   const apiUrl = 'http://localhost:3000';

//   final response = await http.post(Uri.parse(apiUrl), body: {
//     'username': username,
//     'password': password,
//     'email': email,
//   });

//   if (response.statusCode == 200) {
//     print('successfully done');
//   } else {
//     // Handle errors if the API request fails
//     throw Exception('Failed to send data to the API');
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';

// String ngroklink = 'http://ec2-15-206-81-114.ap-south-1.compute.amazonaws.com';
String ngroklink =
    'https://0a9d-2409-40d1-1005-7233-c936-c35d-608e-3865.ngrok-free.app';
Future<void> sendDataToApi(String username, String password) async {
  print("Sending data to API: username=$username, password=$password");

  final apiUrl = '$ngroklink/api/v1/auth/login';

  try {
    print("hii");
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': username,
        'password': password,
      }),
      //body: jsonEncode(<String, String>{"email": "HH", "password": "HH1"}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
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

Future<void> sendDataToApi1(String username, String password, String email,
    String coordinate, String state, String city, String role) async {
  print(
      "Sending data to API: username=$username, password=$password, email=$email");

  final apiUrl = '$ngroklink/api/v1/auth/register';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
        'email': email,
        'coordinates': "1230978",
        'state': "PUNJAB ",
        'city': "BHATINDA",
        'role': "user",
      }),
      // body: jsonEncode({
      //   "username": "vgvyjh",
      //   "email": "h",
      //   "password": "vgbhghj",
      //   "coordinates": "",
      //   "state": "dd",
      //   "city": "dwhjdjh"
      // }),
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

void postDataToApiAddress(LatLng currentLocation, String currentAddress) async {
  final apiUrl = '$ngroklink/api/v1/getCadet/:userId';

  Map<String, dynamic> requestData = {
    'latitude': currentLocation.latitude,
    'longitude': currentLocation.longitude,
    'address': currentAddress,
  };

  try {
    var response = await http.post(
      Uri.parse(apiUrl),
      body: requestData,
    );

    if (response.statusCode == 200) {
      // Request successful, do something with the response
      print('Data posted successfully');
    } else {
      // Request failed, handle the error
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  } catch (error) {
    // Handle any error that might occur during the HTTP request
    print('Error: $error');
  }
}

void getDataFromApiAddress(LatLng cadetLocation) async {
  String apiUrl = '$ngroklink/api/v1/getCadet/:userId';

  // Map<String, dynamic> requestData = {
  //   'latitude': currentLocation.latitude,
  //   'longitude': currentLocation.longitude,
  //   'address': currentAddress,
  // };

  try {
    var response = await http.get(
      Uri.parse(apiUrl),
      //body: requestData,
    );

    if (response.statusCode == 200) {
      // Request successful, do something with the response
      print('Data posted successfully');
    } else {
      // Request failed, handle the error
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  } catch (error) {
    // Handle any error that might occur during the HTTP request
    print('Error: $error');
  }
}
