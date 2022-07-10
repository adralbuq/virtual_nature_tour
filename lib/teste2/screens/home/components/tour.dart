import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:virtual_nature_app_tour/teste2/screens/home/components/tour2.dart';

class Tour extends StatefulWidget {
  const Tour({Key? key}) : super(key: key);

  @override
  _TourState createState() => _TourState();
}

class _TourState extends State<Tour> {
  Color mainColor = Color.fromARGB(255, 25, 88, 70);

  String dataSource = "assets/videos/bonito.mp4";

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
              child: Text("Bonito - PE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold))),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  "Localizada a 140 Km do Recife e conhecida como um oásis em pleno agreste nordestino, Bonito é um destino recheado de atrações turísticas, dentre elas, podem se destacar: cachoeiras, passeio de balão, camping, ecoparque, rapel, escalada, dentre outros. Já foi reconhecida como uma das 7 maravilhas de Pernambuco sendo um excelente destino para quem curte aventura e ecoturismo.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
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
                            builder: (context) => Tour2(),
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
