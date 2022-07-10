import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtual_nature_app_tour/teste2/components/genre_card.dart';
import 'package:virtual_nature_app_tour/teste2/constants.dart';
import 'package:virtual_nature_app_tour/teste2/models/movie.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:virtual_nature_app_tour/teste2/screens/home/components/tour.dart';
import 'backdrop_rating.dart';
import 'title_duration_and_fav_btn.dart';
import 'package:virtual_nature_app_tour/teste2/screens/details/components/genres.dart';

class Body extends StatelessWidget {
  final Movie movie;

  const Body({Key? key, required this.movie}) : super(key: key);

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      BackdropAndRating(size: size, movie: movie),
      SizedBox(height: kDefaultPadding / 2),
      TitleDurationAndFabBtn(movie: movie),
      Genres(movie: movie),
      Padding(
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding / 1,
            horizontal: kDefaultPadding,
          ),
          child: Text(
            "Qual sua próxima aventura?",
            style: Theme.of(context).textTheme.headline5,
          )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Text(
          movie.plot,
          style: TextStyle(
            color: Color.fromARGB(255, 51, 54, 121),
          ),
        ),
      ),
      Padding(padding: EdgeInsets.only(bottom: 60)),
      Column(
        children: [
          MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tour(),
                    ));
              },
              minWidth: double.minPositive,
              color: Color.fromARGB(255, 111, 143, 111),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "     Tour Virtual  >>  ",
                style: TextStyle(color: Colors.white, fontSize: 19),
              )),
        ],
      )
    ]);
  }
}
