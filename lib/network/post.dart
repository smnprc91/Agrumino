import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ThingsBoardPost {
 static Future post() async {
    try {
      var response = await Dio().post(
          'https://demo.thingsboard.io:443/api/auth/login',
          data: {"username": "smnprc91@gmail.com", "password": "porcapaletta"});
          print(response.data);
    } catch (e) {
      print("Errore");
    }
  }
}
