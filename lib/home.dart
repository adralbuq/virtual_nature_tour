import 'package:flutter/material.dart';
import 'package:virtual_nature_app_tour/login.dart';
import 'package:virtual_nature_app_tour/cadastro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          "assets/images/nature6.gif",
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
                  "Seja bem-vindo (a)!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 111, 233, 12),
                      fontSize: 25),
                )),
                Padding(padding: EdgeInsets.only(bottom: 85)),
                Column(
                  children: [
                    MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ));
                        },
                        minWidth: double.minPositive,
                        color: Color.fromARGB(255, 64, 104, 64),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "               Login               ",
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
                                    builder: ((context) => Cadastro())));
                          },
                          minWidth: double.minPositive,
                          color: Color.fromARGB(255, 64, 104, 64),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            "      Criar uma conta      ",
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
      ],
    ));
  }
}
