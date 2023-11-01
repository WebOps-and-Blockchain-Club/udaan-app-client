import 'package:http/http.dart' as http;

Future<void> sendDataToApi(
    String username, String password, String type) async {
  const apiUrl = 'http://localhost:3000';

  final response = await http.post(Uri.parse(apiUrl), body: {
    'type': type,
    'username': username,
    'password': password,
  });

  if (response.statusCode == 200) {
    print('successfully done');
  } else {
    // Handle errors if the API request fails
    throw Exception('Failed to send data to the API');
  }
}
