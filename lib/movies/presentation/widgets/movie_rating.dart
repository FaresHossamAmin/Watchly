import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieRating extends StatelessWidget {
  final double rating;
  const MovieRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 18,
      onRatingUpdate: (_) => {},
      initialRating: rating / 2,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 2),
      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
    );
  }
}
