// Our movie model
class Movie {
  final int id, metascoreRating;
  final double rating;
  final List<String> genra;
  final String plot, title, poster, backdrop, video;
  final List<Map> cast;

  Movie({
    required this.poster,
    required this.backdrop,
    required this.title,
    required this.video,
    required this.id,
    required this.metascoreRating,
    required this.rating,
    required this.genra,
    required this.plot,
    required this.cast,
  });
}

// our demo data movie data
List<Movie> movies = [
  Movie(
    id: 1,
    title: "Bonito",
    poster: "assets/images/poster_1.jpg",
    backdrop: "assets/images/backdrop_1.jpg",
    video: "assets/videos/bonito.mp4",
    rating: 7.3,
    metascoreRating: 76,
    genra: ["Cachoeira", "Passeio de Balão", "Rapel"],
    plot: plotText,
    cast: [],
  ),
  Movie(
    id: 2,
    title: "Praia de Calhetas",
    poster: "assets/images/poster_2.jpg",
    backdrop: "assets/images/backdrop_2.jpg",
    video: "assets/videos/calhetas.mp4",
    rating: 8.2,
    metascoreRating: 76,
    genra: ["Praia", "Tirolesa", "Trilhas"],
    plot: plotText,
    cast: [],
  ),
  Movie(
    id: 3,
    title: "Lagoa Azul",
    poster: "assets/images/poster_3.jpg",
    backdrop: "assets/images/backdrop_3.jpg",
    video: "assets/videos/lagoazul.mp4",
    rating: 7.6,
    metascoreRating: 79,
    genra: ["Tirolesa", "Passeio de lancha", "Trilhas", "Rapel"],
    plot: plotText,
    cast: [],
  ),
];

String plotText =
    "Destinos naturais estão em alta com o cenário pós-pandêmico. Aventure-se pelo ecoturismo e opte por uma experiência sustentável explorando o que de melhor a natureza tem para oferecer. Para fazer um Tour Virtual pelos destinos clique no botão abaixo:";
