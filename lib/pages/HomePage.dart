import 'package:agrumino/pages/datascreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token =
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzbW5wcmM5MUBnbWFpbC5jb20iLCJ1c2VySWQiOiI4MmI2OTk4MC0zNGM1LTExZWQtODljMi03YjhlOWMzM2ZkNzMiLCJzY29wZXMiOlsiVEVOQU5UX0FETUlOIl0sImlzcyI6InRoaW5nc2JvYXJkLmlvIiwiaWF0IjoxNjY3MjkxMTUxLCJleHAiOjE2NjkwOTExNTEsImZpcnN0TmFtZSI6IlNpbW9uZSIsImxhc3ROYW1lIjoiUG9yY3UiLCJlbmFibGVkIjp0cnVlLCJwcml2YWN5UG9saWN5QWNjZXB0ZWQiOnRydWUsImlzUHVibGljIjpmYWxzZSwidGVuYW50SWQiOiI4MTYxOTBkMC0zNGM1LTExZWQtODljMi03YjhlOWMzM2ZkNzMiLCJjdXN0b21lcklkIjoiMTM4MTQwMDAtMWRkMi0xMWIyLTgwODAtODA4MDgwODA4MDgwIn0.ejnu2TmSsFDw9Yv6GIXiFAEF9H-SEe22X8DeVIHanfAtZmJseLIS-xul9pMjoEeWwSuk09LmPUlG96_pcnq6gg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Agrumino"),
          leading: IconButton(
              onPressed: () {
                setState(() {
                  token =
                      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzbW5wcmM5MUBnbWFpbC5jb20iLCJ1c2VySWQiOiI4MmI2OTk4MC0zNGM1LTExZWQtODljMi03YjhlOWMzM2ZkNzMiLCJzY29wZXMiOlsiVEVOQU5UX0FETUlOIl0sImlzcyI6InRoaW5nc2JvYXJkLmlvIiwiaWF0IjoxNjY3MjkxMTUxLCJleHAiOjE2NjkwOTExNTEsImZpcnN0TmFtZSI6IlNpbW9uZSIsImxhc3ROYW1lIjoiUG9yY3UiLCJlbmFibGVkIjp0cnVlLCJwcml2YWN5UG9saWN5QWNjZXB0ZWQiOnRydWUsImlzUHVibGljIjpmYWxzZSwidGVuYW50SWQiOiI4MTYxOTBkMC0zNGM1LTExZWQtODljMi03YjhlOWMzM2ZkNzMiLCJjdXN0b21lcklkIjoiMTM4MTQwMDAtMWRkMi0xMWIyLTgwODAtODA4MDgwODA4MDgwIn0.ejnu2TmSsFDw9Yv6GIXiFAEF9H-SEe22X8DeVIHanfAtZmJseLIS-xul9pMjoEeWwSuk09LmPUlG96_pcnq6gg";
                });
              },
              icon: Icon(Icons.refresh)),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (text) {
                    token = text;
                  },
                  decoration: InputDecoration(
                      labelText: 'Inserire qui il token di accesso',
                      hintText: token),
                ),
              ),
              TextButton(
                onPressed: () {
              
                  String push = token;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataScreen(token: push,)),
                  );
                },
                child: Text('Login'),
              )
            ],
          ),
        ));
  }
}
