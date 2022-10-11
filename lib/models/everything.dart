import 'package:agrumino/models/illuminance.dart';
import 'package:agrumino/models/soil.dart';
import 'package:agrumino/models/temp.dart';

class Everything{

final List<Temperature> temperatures;
final List<Soil> soils;
final List <Illuminance> illuminances;
 Everything({

   
    required this.temperatures,
    required this.soils,
    required this.illuminances,
  });


  factory Everything.fromjson(Map<String , dynamic> json) =>Everything(
   
    temperatures: (json['temperature'] as List).map((temperature)=>
          Temperature.fromJson(temperature)).toList(),
    soils: (json['soilMoisture'] as List).map((soils)=>
          Soil.fromJson(soils)).toList(),      
    illuminances: (json['illuminance'] as List).map((soils)=>
          Illuminance.fromJson(soils)).toList(),
 );
}

 


  