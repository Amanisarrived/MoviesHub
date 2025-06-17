import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/widgets/mainscreen/button_widget.dart';
import 'package:movie_app/widgets/moviewidget/movie_image.dart';
import 'package:movie_app/widgets/moviewidget/movie_image_gradient.dart';


class MvoiesDetail extends StatelessWidget {
  const MvoiesDetail({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.overview,
    required this.releaseDate,
  });
  final String image;
  final String title;
  final double rating;
  final String overview;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    // Screen ki height le lo
    final double screenHeight = MediaQuery.of(context).size.height;
    // Image ko screen ki 70% height de do
    final double imageHeight = screenHeight * 0.7; // <--- Yahan 0.7 kar diya

    return Scaffold(
      backgroundColor: const Color.fromRGBO(17, 17, 17, 1),
      body: Stack(
        children: [
          MovieImage(imageHeight: imageHeight, image: image),

          MovieImageGradient(
            screenHeight: screenHeight,
            imageHeight: imageHeight,
          ),

          Positioned(
            bottom: (screenHeight - imageHeight) + -190,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "${(rating / 2).toStringAsFixed(1)} / 5",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      RatingBarIndicator(
                        rating: rating / 2,
                        itemSize: 20,
                        unratedColor: Color.fromRGBO(136, 136, 136, 1),
                        itemCount: 5,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 199, 0, 1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  Text(
                    overview,
                    style: TextStyle(
                      color: Color.fromRGBO(136, 136, 136, 1),
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ButtonWidget(onPressed: () {})],
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
