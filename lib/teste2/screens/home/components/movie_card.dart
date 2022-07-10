import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:virtual_nature_app_tour/teste2/constants.dart';
import 'package:virtual_nature_app_tour/teste2/models/movie.dart';
import 'package:virtual_nature_app_tour/teste2/screens/details/details_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    movie: movie,
                  ),
                )),
            child: Column(children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [kDefaultShadow],
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(movie.poster),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/icons/star_fill.svg",
                    height: 20,
                  ),
                  SizedBox(width: kDefaultPadding / 2),
                  Text(
                    "${movie.rating}",
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              )
            ])));
  }
}
