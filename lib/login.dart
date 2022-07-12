import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:virtual_nature_app_tour/cadastro.dart';
import 'package:virtual_nature_app_tour/destino.dart';
import 'package:virtual_nature_app_tour/senha.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

bool _showPassword = false;

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  login() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      if (userCredential != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Destino(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('E-mail não encontrado'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Sua senha está errada! Por favor, digite novamente.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
          child: Image.asset(
        "assets/images/nature2.png",
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'E-mail',
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 15,
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
                      controller: _passwordController,
                      obscureText: _showPassword == false ? true : false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Senha',
                        suffixIcon: GestureDetector(
                          child: Icon(
                              _showPassword == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white),
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 5),

            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Senha(),
                    ));
              },
              child: Text('Esqueceu a senha ?',
                  style: TextStyle(color: Colors.white)),
            ),

            // Botão de Login
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        login();
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ))),

            //SizedBox(height: 1),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Não possui uma conta ?",
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cadastro(),
                      ));
                },
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(
                      color: Color.fromARGB(255, 17, 180, 58),
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
          ]),
    ]));
  }
}
