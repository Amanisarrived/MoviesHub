import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({required this.overview,required this.releaseDate,required this.title,required this.rating,super.key});
  final double rating;
  final String title;
  final String releaseDate;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "${(rating / 2).toStringAsFixed(1)} / 5",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 6),
                  RatingBarIndicator(
                    rating: rating / 2,
                    itemSize: 20,
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                        Icon(Icons.star, color: Color.fromRGBO(255, 199, 0, 1)),
                  ),

                ],
              ),
              SizedBox(height: 15),
              Text(
                "Release Date: $releaseDate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),

              Text(
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                overview,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        );
  }
}