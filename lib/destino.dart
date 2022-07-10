import 'package:flutter/material.dart';
import 'package:virtual_nature_app_tour/login.dart';
import 'package:virtual_nature_app_tour/home.dart';
import 'package:virtual_nature_app_tour/teste2/screens/home/home_screen.dart';

class Destino extends StatefulWidget {
  @override
  _DestinoState createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
          child: Image.asset(
        "assets/images/nature1.gif",
        fit: BoxFit.cover,
        color: Colors.black38,
        colorBlendMode: BlendMode.difference,
      )),
      Column(
        children: [
          Image.asset("assets/images/logo.png"),
          Column(
            children: [
              Positioned.fill(
                  child: Text(
                " Bem-vindo (a) ao App!\nExplore um destino de natureza.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF062B01),
                    fontSize: 26),
              )),
              Padding(padding: EdgeInsets.only(bottom: 85)),
              Column(
                children: [
                  MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      },
                      minWidth: double.minPositive,
                      color: Color.fromARGB(255, 64, 104, 64),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "         Explorar   >>   ",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      )),
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  Column(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Home())));
                        },
                        minWidth: double.minPositive,
                        color: Color.fromARGB(255, 64, 104, 64),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          " << Sair da Sessão ",
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      )
    ]));
  }
}
