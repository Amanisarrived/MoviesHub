import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/widgets/mainscreen/card_widget.dart';

class LatestMoviesWidget extends StatelessWidget {
  const LatestMoviesWidget({required this.latestMovies, super.key});

  final List<MoviesModel> latestMovies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(17, 17, 17, 1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 15, right: 15,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "Latest Movies",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "SEE MORE",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(255, 199, 0, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: latestMovies.length,
                itemBuilder: (context, index) {
                  final latest = latestMovies[index];
                  final pathurl =
                      "https://image.tmdb.org/t/p/w500${latest.posterPath}";

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CardWidget(
                      releaseDate: latest.releaseDate,
                      rating: latest.averageRating,
                      image: pathurl,
                      title: latest.title,
                      overview: latest.overview,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
