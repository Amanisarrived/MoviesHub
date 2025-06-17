// lib/screens/latest_movies_screen.dart (Nayi file)
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/widgets/moviewidget/latest_movies.dart';
import 'package:provider/provider.dart';
// import 'package:movie_app/features/movies/providers/movie_provider.dart';

class LatestMoviesScreen extends StatefulWidget {
  const LatestMoviesScreen({super.key});

  @override
  State<LatestMoviesScreen> createState() => _LatestMoviesScreenState();
}

class _LatestMoviesScreenState extends State<LatestMoviesScreen> {
  @override
  void initState() {
    super.initState();
    // Using addPostFrameCallback to avoid setState during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final movieProvider = Provider.of<MovieProvider>(context, listen: false);
      if (movieProvider.latestMovies.isEmpty && !movieProvider.isLoadingLatest) {
        movieProvider.fetchLatestMovies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, movieProvider, child) {
        if (movieProvider.isLoadingLatest) {
          return Center(
            child: Lottie.asset(
              "lib/assets/loading.json",
              width: 50,
              height: 50,
            ),
          );
        } else if (movieProvider.errorLatest != null) {
          return Center(child: Text("❌ Error: ${movieProvider.errorLatest}"));
        } else if (movieProvider.latestMovies.isEmpty) {
          return Center(child: Text("No latest movies found."));
        } else {
          return LatestMoviesWidget(latestMovies: movieProvider.latestMovies);
        }
      },
    );
  }
}
