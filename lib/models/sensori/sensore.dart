import 'package:agrumino/models/sensori/id.dart';

class Sensore {
  final IdDevice id;
  final String name;
  final String type;
  final String label;
  Sensore(
      {required this.id,
      required this.name,
      required this.type,
      required this.label});

  factory Sensore.fromJson(Map<String, dynamic> json) {
    return Sensore(
        id: IdDevice.fromJson(json["id"]),
        name: json['name'],
        type: json["type"],
        label: json["label"]);
  }
}
