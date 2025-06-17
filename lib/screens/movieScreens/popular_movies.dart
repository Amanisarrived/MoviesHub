// lib/screens/popular_movies_screen.dart (Nayi file)
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/widgets/moviewidget/popular_movie_widget.dart';
import 'package:provider/provider.dart';
// import 'package:movie_app/features/movies/providers/movie_provider.dart'; // MovieProvider import kiya

class PopularMoviesScreen extends StatefulWidget {
  const PopularMoviesScreen({super.key});

  @override
  State<PopularMoviesScreen> createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen> {
  @override
  void initState() {
    super.initState();
    // Using addPostFrameCallback to avoid setState during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final movieProvider = Provider.of<MovieProvider>(context, listen: false);
      if (movieProvider.popularMovies.isEmpty && !movieProvider.isLoadingPopular) {
        movieProvider.fetchPopularMovies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Yahan MovieProvider ko sunenge data ke liye
    return Consumer<MovieProvider>(
      builder: (context, movieProvider, child) {
        if (movieProvider.isLoadingPopular) {
          return Center(
            child: Lottie.asset(
              "lib/assets/loading.json", // Loading animation
              width: 50,
              height: 50,
            ),
          );
        } else if (movieProvider.errorPopular != null) {
          return Center(child: Text("❌ Error: ${movieProvider.errorPopular}"));
        } else if (movieProvider.popularMovies.isEmpty) {
          return Center(child: Text("Koi popular movies nahi mili."));
        } else {
          // Data mil gaya, ab dikhao list
          return PopularMoviesWidget(popularMovies: movieProvider.popularMovies,);
        }
      },
    );
  }
}