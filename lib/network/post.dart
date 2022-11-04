import 'dart:convert';

import 'package:agrumino/models/http/post.dart';
import 'package:http/http.dart' as http;

class ThingsBoardPost {
  Future<PostResponse> fetchpost() async {
    final response = await http.post(
        Uri.parse('https://demo.thingsboard.io:443/api/auth/login'),
        body: jsonEncode({"username": "smnprc91@gmail.com", "password": "porcapaletta"}));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return PostResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load response');
    }
  }
}
