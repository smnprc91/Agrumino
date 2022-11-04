import 'package:agrumino/bloc/bloc.dart';
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
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Agrumino"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [firstcolumnobj(context), secondcolumnobj(context)],
          ),
        ));
  }
}

firstcolumnobj(context) {
  return Padding(
    padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.1,
        bottom: MediaQuery.of(context).size.height * 0.1),
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.transparent,
        ),
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width * 0.6,
        child: const Center(
            child: Text(
          "Inserisci i dati per il login",
          style: TextStyle(color: Colors.green, fontSize: 20),
        ))),
  );
}

secondcolumnobj(context) {
  Mybloc bloc = Mybloc();
  return Center(
    child: Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          const TextField(
            decoration:
                InputDecoration(labelText: 'Username', hintText: "Username"),
          ),
          const TextField(
            decoration:
                InputDecoration(labelText: 'Password', hintText: "Password"),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
            ),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                /* int i = 1;
                if (i == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DataScreen(
                              token: "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzbW5wcmM5MUBnbWFpbC5jb20iLCJ1c2VySWQiOiI4MmI2OTk4MC0zNGM1LTExZWQtODljMi03YjhlOWMzM2ZkNzMiLCJzY29wZXMiOlsiVEVOQU5UX0FETUlOIl0sImlzcyI6InRoaW5nc2JvYXJkLmlvIiwiaWF0IjoxNjY3NTg1NDQ4LCJleHAiOjE2NjkzODU0NDgsImZpcnN0TmFtZSI6IlNpbW9uZSIsImxhc3ROYW1lIjoiUG9yY3UiLCJlbmFibGVkIjp0cnVlLCJwcml2YWN5UG9saWN5QWNjZXB0ZWQiOnRydWUsImlzUHVibGljIjpmYWxzZSwidGVuYW50SWQiOiI4MTYxOTBkMC0zNGM1LTExZWQtODljMi03YjhlOWMzM2ZkNzMiLCJjdXN0b21lcklkIjoiMTM4MTQwMDAtMWRkMi0xMWIyLTgwODAtODA4MDgwODA4MDgwIn0.LmOPD-JXI4cU57u1S8oWHVkv_qwS0CfrjjsP9-1VywZ85hhtbz1lSOt9RVMozBpI1fC5avUJZ5SmxRTAFYlZww",
                            )),
                  );
                } */
                bloc.sendpost();
              },
              child: const Text(
                'Invia',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
