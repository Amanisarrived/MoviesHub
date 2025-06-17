import 'package:flutter/material.dart';

class MovieImageGradient extends StatelessWidget {
  const MovieImageGradient({
    required this.imageHeight,
    required this.screenHeight,
    super.key,
  });

  final double screenHeight;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 1,
      left: 0,
      right: 0,
      child: Container(
        height:
            imageHeight *
            0.6, // Gradient ki height, poster height ka 40% (adjust kar sakte ho)
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(0, 0, 0, 0.5),
              Color.fromRGBO(0, 0, 0, 0),
            ],
          ),
        ),
      ),
    );
  }
}
