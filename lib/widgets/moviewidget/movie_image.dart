import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({required this.image,required this.imageHeight,super.key});

  final double imageHeight;
  final String image;

  @override
  Widget build(BuildContext context) {
    return  Positioned(
            top: 0,
            left: 0,
            right: 0,
            // Image ki height yahan set karenge
            height: imageHeight, // <--- Ab ye screen ki 70% height lega
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover, // Image ko container mein fit karega
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey,
                    child: const Center(
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }
}