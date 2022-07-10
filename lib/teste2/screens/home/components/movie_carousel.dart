import 'package:flutter/material.dart';
import 'package:virtual_nature_app_tour/teste2/constants.dart';

import 'dart:math' as math;

import 'package:virtual_nature_app_tour/teste2/models/movie.dart';
import 'package:virtual_nature_app_tour/teste2/screens/home/components/movie_card.dart';

class MovieCarousel extends StatefulWidget {
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late PageController _pageController;
  int initialPage = 1;

  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) => buildMovieSlider(index),
        ),
      ),
    );
  }

  Widget buildMovieSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page!;
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
              duration: Duration(milliseconds: 350),
              opacity: initialPage == index ? 1 : 0.4,
              child: Transform.rotate(
                angle: math.pi * value,
                child: MovieCard(movie: movies[index]),
              ));
        },
      );
}
