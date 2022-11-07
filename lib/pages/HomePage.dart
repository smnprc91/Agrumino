import 'package:agrumino/bloc/bloc.dart';
import 'package:agrumino/pages/deviceList.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: const AssetImage("assets/leaf.png"),
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.4), BlendMode.dstATop),
          ),
        ),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("My Agrumino"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  firstcolumnobj(context),
                  secondcolumnobj(context, username, password)
                ],
              ),
            ),
          )),
    ]);
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
            child: AutoSizeText(
          "Inserisci i dati per il login",
          style: TextStyle(color: Colors.green, fontSize: 20),
        ))),
  );
}

secondcolumnobj(context, username, password) {
  Mybloc bloc = Mybloc();
  return Center(
    child: Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          TextField(
            onChanged: (newusername) {
              username = newusername;
            },
            decoration: const InputDecoration(
                labelText: 'Username', hintText: "Username"),
          ),
          TextField(
            onChanged: (newpassword) {
              password = newpassword;
            },
            decoration: const InputDecoration(
                labelText: 'Password', hintText: "Password"),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
            ),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                bloc.sendpost(username, password);
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    title: const Center(child: Text("Caricamento")),
                    actions: <Widget>[
                      StreamBuilder(
                        stream: bloc.streamtoken,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            String token = snapshot.data;

                            Future.delayed(const Duration(milliseconds: 100),
                                () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LA(
                                          token: token,
                                        )),
                              );
                            });

                            return const Center(
                              child: Text("Login effetuato con successo"),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      )
                    ],
                  ),
                );
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
