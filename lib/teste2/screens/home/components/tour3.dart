import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:virtual_nature_app_tour/teste2/screens/home/components/tour.dart';

import '../../../../destino.dart';

class Tour3 extends StatefulWidget {
  const Tour3({Key? key}) : super(key: key);

  @override
  _Tour3State createState() => _Tour3State();
}

class _Tour3State extends State<Tour3> {
  Color mainColor = Color.fromARGB(255, 25, 88, 70);

  String dataSource = "assets/videos/lagoazul.mp4";

  VideoPlayerController? _controller;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(dataSource)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0.0,
        title: Text("Tour Virtual"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                )
              : Container(),
          VideoProgressIndicator(
            _controller!,
            allowScrubbing: true,
            padding: EdgeInsets.all(0.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.skip_previous),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  _controller!.value.isPlaying
                      ? _controller!.pause()
                      : _controller!.play();
                },
                icon: Icon(Icons.play_arrow),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.skip_next),
                color: Colors.white,
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text("Lagoa Azul",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold))),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  "Um verdadeiro santuário ecológico com uma mistura de verde, lagoas profundas e paredões rochosos. A Lagoa Azul está localizada no município de Jaboatão dos Guararapes-PE e atualmente encontra-se interditada. Pela sua beleza, demonstra uma excelente opção para os aventureiros que buscam praticar o mergulho, fazer trilha ecológica ou praticar esportes radicais, como rapel e tirolesa. Esbanja beleza natural com nascente cristalina, cachoeira e proporciona ainda um ambiente ideal para quem busca tranquilidade. Tendo sido considerada uma das maravilhas de Pernambuco, turistas aguardam ansiosos uma possível reabertura do local ao público.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 110),
              child: Container(
                padding: EdgeInsets.all(15),
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
                            builder: (context) => Destino(),
                          ));
                    },
                    child: Text('Finalizar Tour',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ))),
              ))
        ],
      ),
    );
  }
}
