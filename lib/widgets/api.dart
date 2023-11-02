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

Future<void> sendDataToApi(String username, String password) async {
  print("Sending data to API: username=$username, password=$password");

  const apiUrl = 'http://localhost:3000/api/v1/auth/login';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("Response data: $data");
      print('Successfully done');
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
    String username, String password, String email) async {
  print(
      "Sending data to API: username=$username, password=$password, email=$email");

  const apiUrl = 'http://localhost:3000/api/v1/auth/register';

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
    throw Exception('Failed to send data to the API');
  }
}
