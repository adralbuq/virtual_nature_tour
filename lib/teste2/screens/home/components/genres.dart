import 'package:flutter/material.dart';
import 'package:virtual_nature_app_tour/teste2/constants.dart';
import 'package:virtual_nature_app_tour/teste2/components/genre_card.dart';

class Genres extends StatelessWidget {
  Widget build(BuildContext context) {
    List<String> genres = [
      "Cachoeira",
      "Praia",
      "Trilhas",
      "Campo",
      "Passeio de Balão",
      "Tirolesa",
      "Excursão de barco",
      "Esportes radicais",
      "Passeio de lancha",
      "Rapel"
    ];
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) => GenreCard(genre: genres[index]),
      ),
    );
  }
}
