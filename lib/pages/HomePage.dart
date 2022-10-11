import 'dart:developer';
import 'package:agrumino/network/get.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: ThingsBoard.poldo(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              inspect(snapshot.data.temperatures.length);
              inspect(snapshot.data);
              return ListView.builder(
                  itemCount: snapshot.data.temperatures.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            children: [
                              const Text("Temperature"),
                              Text(snapshot.data.temperatures[index].ts
                                  .toString()),
                              Text(snapshot.data.temperatures[index].value
                                  .toString()),
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
