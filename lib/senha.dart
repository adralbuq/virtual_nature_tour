import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Senha extends StatefulWidget {
  static var routeNamed;

  @override
  _SenhaState createState() => _SenhaState();
}

class _SenhaState extends State<Senha> {
  late String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
          child: Image.asset(
        "assets/images/nature4.png",
        fit: BoxFit.cover,
        color: Colors.black38,
        colorBlendMode: BlendMode.difference,
      )),
      Column(children: [
        Image.asset("assets/images/logo.png"),
        SizedBox(
          height: 100,
        ),
      ]),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 250,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 130, 160, 133),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'E-mail',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                  ),
                )),
            SizedBox(height: 20),
            Text(
              'Por favor, informe o e-mail cadastrado e clique no botão abaixo para receber o link de redefinição da senha.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 30),
            // Botão de Recuperação de Senha
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Container(
                  padding: EdgeInsets.all(14),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        auth.sendPasswordResetEmail(email: _email);
                        Navigator.of(context).pop();
                      },
                      child: Text('Redefinir Senha',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ))),
                ))
          ])
    ]));
  }
}
