import 'package:flutter/material.dart';
import 'package:virtual_nature_app_tour/login.dart';

class Registrook extends StatefulWidget {
  @override
  _RegistrookState createState() => _RegistrookState();
}

class _RegistrookState extends State<Registrook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 152, 177, 153),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 380,
            ),
            SizedBox(
              height: 1,
            ),
            Text(
              'Cadastro efetuado com sucesso! clique no botão abaixo para realizar o login no App:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            SizedBox(height: 40),
            // Botão de Recuperação de Senha
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Container(
                  padding: EdgeInsets.all(90),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                      },
                      child: Text('Login ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ))),
                ))
          ],
        )));
  }
}
