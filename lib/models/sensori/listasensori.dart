import 'package:agrumino/models/sensori/sensore.dart';

class ListSensori {
  final List<Sensore> sensore;

  ListSensori({
    required this.sensore,
  });

  factory ListSensori.fromjson(Map<String, dynamic> json) => ListSensori(
        sensore: (json['data'] as List).map((sensore) => Sensore.fromJson(sensore))
            .toList(),
      );
}
