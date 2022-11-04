import 'dart:convert';
import 'dart:io';
import 'package:agrumino/models/everything.dart';
import 'package:http/http.dart' as http;

class ThingsBoard {
  static Future get(ingressotoken) async {
    var now = DateTime.now().millisecondsSinceEpoch;

    String token = ingressotoken;

    var response = await http.get(
      Uri.parse(
          'https://demo.thingsboard.io:443/api/plugins/telemetry/DEVICE/a1449830-4554-11ed-b827-c9be76c6f5d7/values/timeseries?keys=temperature%2CbatteryLevel%2Cilluminance%2CsoilMoisture&startTs=1662823305000&endTs=' +
              now.toString()),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      //print(response.body);

      return Everything.fromjson(jsonDecode(response.body));
    } else {
      throw Exception('can t load un cazzo di nulla zio pera');
    }
  }
}
