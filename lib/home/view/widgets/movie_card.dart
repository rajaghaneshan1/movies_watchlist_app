import 'package:flutter/material.dart';
import 'package:movies_watchlist_app/home/controller/firebase_controller.dart';
import 'package:movies_watchlist_app/home/model/movie_model.dart';

import '../../../constants.dart';
import 'delete_bottom_sheet.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  final MovieModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        color: kRed.withOpacity(0.5),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 120,
              width: 70,
              child: Image.network(
                dataModel.poster ?? placeHolderImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    dataModel.movieTitle,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    dataModel.director,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                showBottomSheet(
                    context: context,
                    builder: (context) {
                      return DeleteBottomSheet(dataModel: dataModel);
                    });
              },
              icon: const Icon(Icons.delete_outline),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
