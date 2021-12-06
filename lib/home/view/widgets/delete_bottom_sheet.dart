import 'package:flutter/material.dart';
import 'package:movies_watchlist_app/home/controller/firebase_controller.dart';
import 'package:movies_watchlist_app/home/model/movie_model.dart';

import '../../../constants.dart';

class DeleteBottomSheet extends StatelessWidget {
  const DeleteBottomSheet({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  final MovieModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Are you sure! you want to remove this movie ?',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'No, close',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                style: elevatedButtonStyle,
                onPressed: () async {
                  await FirebaseController.removeMovieFromFirebase(
                      dataModel.id);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Yes, Remove',
                  style: buttonTextStyle,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
