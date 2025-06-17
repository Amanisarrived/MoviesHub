import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/models/movie_serch_model.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    required this.isLoading,
    required this.movieserch,
    required this.serchedMovies,
    super.key,
    this.erroressage,
  });

  final bool isLoading;
  final String? erroressage;
  final List<MovieSerchModel> serchedMovies;
  final TextEditingController movieserch;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: LottieBuilder.asset("lib/assets/loading.json", width: 50),
          ) // Width for Lottie, 5 was too small
        : erroressage != null
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(
                8,
              ), // Changed to const EdgeInsets.all
              child: Text(textAlign: TextAlign.center, erroressage!),
            ),
          )
        : serchedMovies.isEmpty &&
              movieserch
                  .text
                  .isNotEmpty // Jab user ne search kiya ho but koi result na mila ho
        ? Center(child: Text("No movie found for ${movieserch.text}"))
        : serchedMovies.isEmpty &&
              movieserch
                  .text
                  .isEmpty // Initial empty state
        ? const Center(
            child: Text("Start typing to search for movies!"),
          ) // Initial message
        : ListView.builder(
            // Ab yahan Expanded nahi chahiye
            itemCount: serchedMovies.length,
            itemBuilder: (context, index) {
              final search = serchedMovies[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                elevation: 2,
                child: ListTile(
                  leading:
                      // ignore: unnecessary_null_comparison
                      search.poster !=
                          null // Use the getter for full URL
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.network(
                            search.poster, // Use fullPosterUrl
                            width: 50, // Example width
                            height: 75, // Example height
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image, size: 50);
                            },
                          ),
                        )
                      : const Icon(Icons.movie, size: 50),
                  // Release date bhi dikhao
                  // Add more details like overview, etc., if needed
                ),
              );
            },
          );
  }
}
