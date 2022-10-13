import 'dart:convert';

import 'dart:io';
import 'package:agrumino/models/everything.dart';

import 'package:http/http.dart' as http;

class ThingsBoard {
  static Future poldo() async {
    var now = DateTime.now().millisecondsSinceEpoch;
    print(now);
    String token =
        "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzbW5wcmM5MUBnbWFpbC5jb20iLCJ1c2VySWQiOiI4MmI2OTk4MC0zNGM1LTExZWQtODljMi03YjhlOWMzM2ZkNzMiLCJzY29wZXMiOlsiVEVOQU5UX0FETUlOIl0sImlzcyI6InRoaW5nc2JvYXJkLmlvIiwiaWF0IjoxNjY1MzkxNzMxLCJleHAiOjE2NjcxOTE3MzEsImZpcnN0TmFtZSI6IlNpbW9uZSIsImxhc3ROYW1lIjoiUG9yY3UiLCJlbmFibGVkIjp0cnVlLCJwcml2YWN5UG9saWN5QWNjZXB0ZWQiOnRydWUsImlzUHVibGljIjpmYWxzZSwidGVuYW50SWQiOiI4MTYxOTBkMC0zNGM1LTExZWQtODljMi03YjhlOWMzM2ZkNzMiLCJjdXN0b21lcklkIjoiMTM4MTQwMDAtMWRkMi0xMWIyLTgwODAtODA4MDgwODA4MDgwIn0.SZgmtRXq__Sl41zwsodNViyB-Dynj21LOU3aDS0b6EqMAoY2loVWPZIAY9FP58ehMmbtVXDgKMLq4SRgVKFWdw";

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
