import 'dart:convert';
import 'dart:io';
import 'package:agrumino/models/sensori/listasensori.dart';
import 'package:http/http.dart' as http;

class ThingsBoardDevice {
  static Future get(ingressotoken) async {
  
    String token = ingressotoken;

    var response = await http.get(
      Uri.parse("https://demo.thingsboard.io:443/api/tenant/devices?pageSize=2&page=0"),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      return (ListSensori.fromjson(jsonDecode(response.body)));

    } else {
      throw Exception('can t load un cazzo di nulla zio pera');
    }
  }
}
