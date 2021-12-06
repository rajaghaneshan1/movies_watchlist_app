import 'package:cloud_firestore/cloud_firestore.dart';

class MovieModel {
  final String id;
  final String movieTitle;
  final String director;
  final String? poster;

  MovieModel({
    required this.id,
    required this.movieTitle,
    required this.director,
    required this.poster,
  });

  factory MovieModel.fromDocument(DocumentSnapshot doc) {
    return MovieModel(
      id: doc['id'],
      movieTitle: doc['movieTitle'],
      director: doc['director'],
      poster: doc['poster'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "movieTitle": movieTitle,
        "director": director,
        "poster": poster,
      };
}

// List<MovieModel> moviesList = [
//   MovieModel(
//       movieTitle: 'Ayudha Eluthu',
//       director: 'Mani Ratnam',
//       poster: placeHolderImage),
//   MovieModel(
//       movieTitle: 'Django Unchained',
//       director: 'Quentin Tarantino',
//       poster: placeHolderImage),
//   MovieModel(
//       movieTitle: 'Sarpatta Parambarai',
//       director: 'Pa. Ranjith',
//       poster: placeHolderImage),
//   MovieModel(
//       movieTitle: 'Hey Ram',
//       director: 'Kamal Hassan',
//       poster: placeHolderImage),
//   MovieModel(
//       movieTitle: 'Jigirthanda',
//       director: 'Karthik Subburaj',
//       poster: placeHolderImage),
// ];
