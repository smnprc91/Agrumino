import 'package:agrumino/models/sensori/listasensori.dart';
import 'package:agrumino/network/getdevice.dart';
import 'package:agrumino/pages/datascreen.dart';
import 'package:flutter/material.dart';

class LA extends StatefulWidget {
  const LA({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<LA> createState() => _LAState();
}

class _LAState extends State<LA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: ThingsBoardDevice.get(widget.token),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              ListSensori listaDevices = snapshot.data;

              return ListView.builder(
                  itemCount: listaDevices.sensore.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            children: [
                              Text(listaDevices.sensore[index].name),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DataScreen(
                                                token: widget.token,
                                                id: listaDevices
                                                    .sensore[index].id.idDevice,
                                              )),
                                    );
                                  },
                                  child: Text(listaDevices
                                      .sensore[index].id.idDevice
                                      .toString()))
                            ],
                          ),
                        ));
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
