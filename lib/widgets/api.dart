import 'package:http/http.dart' as http;

Future<void> sendDataToApi(String username, String password) async {
  const apiUrl = 'http://localhost:3000/api/register';

  final response = await http.post(Uri.parse(apiUrl), body: {
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
