import 'dart:convert';
import 'package:agrumino/bloc/bloc.dart';
import 'package:agrumino/models/http/post.dart';
import 'package:http/http.dart' as http;

class ThingsBoardPost {
  Mybloc mybloc = Mybloc();
  late int status;
  Future<PostResponse> fetchpost(username, password) async {
    final response = await http.post(
        Uri.parse('https://demo.thingsboard.io:443/api/auth/login'),
        body: jsonEncode({"username": username, "password": password}));
    status = response.statusCode;
    
    if (response.statusCode == 200) {
      return PostResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load response');
    }
  }
}
