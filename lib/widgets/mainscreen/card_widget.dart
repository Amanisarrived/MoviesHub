import 'package:flutter/material.dart';
// import "package:flutter_rating_bar/flutter_rating_bar.dart";
import 'package:movie_app/screens/mvoies_detail.dart';
import 'package:movie_app/widgets/moviewidget/movie_title.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    required this.rating,
    required this.image,
    required this.title,
    required this.overview,
    required this.releaseDate,
    super.key,
  });

  void _movieDetailScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MvoiesDetail(
          title: title,
          rating: rating,
          image: image,
          overview: overview,
          releaseDate: releaseDate,
        ),
      ),
    );
  }

  final String title;
  final String image;
  final double rating;
  final String overview;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 273,
          width: 182,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15),
            child: InkWell(
              onTap: () {
                _movieDetailScreen(context);
              },
              child: Image.network(image,colorBlendMode: BlendMode.color, color: Color.fromRGBO(0, 0, 0, 0.5),),
            ),
          ),
        ),
        SizedBox(width: 20),
       MovieTitle(title: title, rating: rating,releaseDate: releaseDate ,overview: overview, ),
      ],
    );
  }
}
