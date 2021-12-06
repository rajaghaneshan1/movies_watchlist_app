import 'package:movies_watchlist_app/home/model/movie_model.dart';

import '../../constants.dart';

class FirebaseController {
  static Future<void> addMovieToFirebase(MovieModel data) async {
    await usersRef
        .doc(firebaseAuth.currentUser!.uid)
        .collection('watchlist')
        .doc(data.id)
        .set({
      'id': data.id,
      'movieTitle': data.movieTitle,
      'director': data.director,
      'poster': data.poster ?? placeHolderImage,
    });
  }

  static Future removeMovieFromFirebase(String id) async {
    usersRef
        .doc(firebaseAuth.currentUser!.uid)
        .collection('watchlist')
        .doc(id)
        .delete();
  }
}
  