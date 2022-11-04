// ignore_for_file: file_names
import 'dart:developer';

import 'package:agrumino/models/batt.dart';
import 'package:agrumino/models/illuminance.dart';
import 'package:agrumino/models/soil.dart';
import 'package:agrumino/models/temp.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../network/get.dart';

class DataScreen extends StatefulWidget {
 
const DataScreen({Key? key,  required this.token}) : super(key: key);
final String token;

  @override
  State<DataScreen> createState() => _DataScreenState();
}


  var controller = 0;
String mytitle = "Agrumino";
// ignore: unused_element
late TooltipBehavior _tooltipBehavior;

class _DataScreenState extends State<DataScreen> {
  @override
  void initState() {
   // print(widget.token);
    super.initState();

    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: controller,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: titolo(controller),
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                controller = index;
              });
            },
            tabs: const [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.thermostat)),
              Tab(icon: Icon(Icons.water)),
              Tab(icon: Icon(Icons.sunny)),
              Tab(icon: Icon(Icons.battery_0_bar)),
            ],
          ),
        ),
        body: FutureBuilder(
            future: ThingsBoard.get(widget.token),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                inspect(snapshot.data);
                List<Temperature> tmp = snapshot.data.temperatures;
                List<Illuminance> luce = snapshot.data.illuminances;
                List<Soil> soil = snapshot.data.soils;
                List<Battery> batt = snapshot.data.batt;

                return TabBarView(children: [
                  general(tmp, luce, soil, batt),
                  data(tmp, "Temperatura"),
                  data(soil, "Soils Moisture"),
                  data(luce, "Illuminance"),
                  data(batt, "Battery")
                ]);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}

Widget general(tmp, luce, soil, batt) {
  return Column(
    children: [
      mycard(tmp, "temperatura"),
      mycard(luce, "luce"),
      mycard(soil, "umidità"),
      mycard(batt, "carica"),
    ],
  );
}

Widget mycard(value, nome) {
  final listamedia = [];
  double sum = 0;
  for (int check = 0; check <= 5; check++) {
    double somma = double.parse(value[check].value);
    listamedia.add(somma);

    //print(tmp[check].value + check.toString());
    // print(listamedia);
  }
  for (var i = 0; i < listamedia.length; i++) {
    sum += listamedia[i];
  }
//print(sum/listamedia.length);
  double media = sum / listamedia.length;
  return Card(
    child: Column(
      children: [
        Text("Ultima rilevazione $nome"),
        Text(value.first.value),
        const Text("Media ultima ora"),
        Text(media.toString())
      ],
    ),
  );
}

Widget data(data, value) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  const Text("Data e ora"),
                  Text(
                    DateTime.fromMicrosecondsSinceEpoch(data[index].ts * 1000)
                        .toString(),
                  ),
                  const Text("Value"),
                  Text(data[index].value.toString()),
                ],
              ),
            ));
      });
}

titolo(controller) {
  if (controller == 0) {
    mytitle = "Generale";
  } else if (controller == 1) {
    mytitle = "Temperatura";
  } else if (controller == 2) {
    mytitle = "Umidità";
  } else if (controller == 3) {
    mytitle = "Luminosità";
  } else if (controller == 4) {
    mytitle = "Batteria";
  }
  return Text(mytitle);
}
