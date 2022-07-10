import 'package:flutter/material.dart';
import 'package:virtual_nature_app_tour/teste2/models/movie.dart';
import 'package:virtual_nature_app_tour/teste2/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({Key? key, required this.movie}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(movie: movie),
    );
  }
}
