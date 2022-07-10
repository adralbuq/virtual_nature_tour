import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:virtual_nature_app_tour/teste2/screens/home/components/tour.dart';
import 'package:virtual_nature_app_tour/teste2/screens/home/components/tour3.dart';

class Tour2 extends StatefulWidget {
  const Tour2({Key? key}) : super(key: key);

  @override
  _Tour2State createState() => _Tour2State();
}

class _Tour2State extends State<Tour2> {
  Color mainColor = Color.fromARGB(255, 25, 88, 70);

  String dataSource = "assets/videos/calhetas.mp4";

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
              child: Text("Praia de Calhetas",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold))),
          SizedBox(height: 1),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  "Localizada no município do Cabo de Santo Agostinho, a praia de Calhetas é conhecida por suas águas cristalinas que são divididas por um paredão de pedras. Sua extensão é pequena e a faixa de areia é curta. Uma das principais atrações deste destino é uma tirolesa que possibilita aos turistas percorrer do alto do morro até o mar com muita adrenalina e emoção.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal))),
          SizedBox(height: 1),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Container(
                padding: EdgeInsets.all(80),
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
                            builder: (context) => Tour3(),
                          ));
                    },
                    child: Text('Próximo Tour >>',
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
