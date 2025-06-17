import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/widgets/mainscreen/card_widget.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({required this.popularMovies, super.key});

  final List<MoviesModel> popularMovies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(17, 17, 17, 1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    "Popular Movies",
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
                itemCount: popularMovies.length,
                itemBuilder: (context, index) {
                  final popular = popularMovies[index];
                  final pathurl =
                      "https://image.tmdb.org/t/p/w500${popular.posterPath}";

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CardWidget(
                      releaseDate: popular.releaseDate,
                      rating: popular.averageRating,
                      image: pathurl,
                      title: popular.title,
                      overview: popular.overview,
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
