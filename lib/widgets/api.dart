/*
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// String ngroklink = 'http://ec2-15-206-81-114.ap-south-1.compute.amazonaws.com';
String ngroklink = 'https://ee8f-103-158-43-46.ngrok-free.app';
Future<void> sendDataToApi(
    String email, String password, Object coordinates) async {
  print(
      "Sending data to API: username=$email, password=$password, coordinates=$coordinates");

  final apiUrl = '$ngroklink/api/v1/auth/login';

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
        'Coordinates': coordinates,
      }),
      //body: jsonEncode(<String, String>{"email": "HH", "password": "HH1"}),
    );

    final data = json.decode(response.body);
    print(data);
    print(data.statusCode);
    print(data.runtimeType);
    if (data.statusCode == 200) {
      print("object");
      String token = data.accessToken;
      print(data);
      print(token);
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

Future<void> sendDataToApi1(
    String username,
    String password,
    String email,
    Object coordinate,
    String state,
    String city,
    String role,
    String address) async {
  print(
      "Sending data to API: username=$username, password=$password, email=$email, address=$address");

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
        'coordinates': {"latitude": 12.993006, "longitude": 80.232651},
        'state': "PUNJAB ",
        'city': "BHATINDA",
        'role': "user",
        'address': address,
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
    print(response);
    if (response.statusCode == 200) {
      final data = response.body;
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

Future<void> _storing() async {
  print("sos");
}

Future<void> sendSOS() async {
  // print("Sending data to API: username=$token, password=");

  final apiUrl = '$ngroklink/api/v1/sos/notifycadets';
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? "";
  try {
    print("hii");
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json', 'auth-token': token},
      // body: jsonEncode({
      //   'token': token,
      // }),
      //body: jsonEncode(<String, String>{"email": "HH", "password": "HH1"}),
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

*/


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
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// String ngroklink = 'http://ec2-15-206-81-114.ap-south-1.compute.amazonaws.com';
String ngroklink = 'https://ee8f-103-158-43-46.ngrok-free.app';
Future<void> sendDataToApi(String email, String password) async {
  print("Sending data to API: username=$email, password=$password");

  final apiUrl = '$ngroklink/api/v1/auth/login';

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
      }),
      //body: jsonEncode(<String, String>{"email": "HH", "password": "HH1"}),
    );

    final data = json.decode(response.body);
    print(data);
    print(data.statusCode);
    print(data.runtimeType);
    if (data.statusCode == 200) {
      print("object");
      String token = data.accessToken;
      print(data);
      print(token);
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

Future<void> sendDataToApi1(
    String username,
    String password,
    String email,
    Object coordinate,
    String state,
    String city,
    String role,
    String address) async {
  print(
      "Sending data to API: username=$username, password=$password, email=$email, address=$address");

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
        'coordinates': {"latitude": 12.993006, "longitude": 80.232651},
        'state': "PUNJAB ",
        'city': "BHATINDA",
        'role': "user",
        'address': address,
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
    print(response);
    if (response.statusCode == 200) {
      final result = response.body;
      final data = json.decode(result);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', data['user'].toString()) ?? "";
      
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

Future<void> _storing() async {
  print("sos");
}

Future<void> sendSOS() async {
  // print("Sending data to API: username=$token, password=");

  final apiUrl = '$ngroklink/api/v1/sos/notifycadets';
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? "";
  try {
    print("hii");
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json', 'auth-token': token},
      // body: jsonEncode({
      //   'token': token,
      // }),
      //body: jsonEncode(<String, String>{"email": "HH", "password": "HH1"}),
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
