import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:virtual_nature_app_tour/teste2/constants.dart';
import 'package:virtual_nature_app_tour/teste2/components/genre_card.dart';
import 'package:virtual_nature_app_tour/teste2/models/movie.dart';
import 'package:virtual_nature_app_tour/teste2/screens/home/components/genres.dart';
import 'package:virtual_nature_app_tour/teste2/screens/home/components/categories.dart';
import 'package:virtual_nature_app_tour/teste2/screens/home/components/movie_card.dart';
import 'dart:math' as math;

import 'package:virtual_nature_app_tour/teste2/screens/home/components/movie_carousel.dart';

class Body extends StatelessWidget {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Categorylist(),
        Genres(),
        SizedBox(height: kDefaultPadding),
        MovieCarousel(),
      ],
    ));
  }
}
