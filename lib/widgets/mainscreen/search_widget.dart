import 'package:flutter/material.dart';
import 'package:movie_app/provider/movie_provider.dart';
import 'package:movie_app/screens/movieScreens/searched_movies.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _userInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (userInput) {
              if (_userInput.text.isNotEmpty) {
                movieProvider.serchMovie(userInput);
              }
            },
            controller: _userInput,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  _userInput.clear();
                  movieProvider.serchmovies.clear();
                  setState(() {});
                },
                icon: const Icon(Icons.clear, color: Colors.white),
              ),
              prefixIcon: Icon(Icons.search, color: Colors.white),

              hintText: "Search movies...",
              hintStyle: const TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: const Color.fromRGBO(48, 48, 48, 1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white24),
              ),
            ),
          ),
        ),
        if (movieProvider.serchmovies.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 8),
            constraints: const BoxConstraints(maxHeight: 300),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: movieProvider.serchmovies.length,
              itemBuilder: (context, index) {
                final movie = movieProvider.serchmovies[index];
                final pathUrl =
                    'https://image.tmdb.org/t/p/w500${movie.poster}';
                return Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      child: Image.network(
                        pathUrl,
                        errorBuilder: (context, errror, stackTrace) {
                          return const Icon(Icons.error, color: Colors.red);
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                    title: Text(
                      movie.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SearchedMovies(
                            title: movie.title,
                            image: pathUrl,
                            overview: movie.overview,
                            rating: movie.rating,
                            releaseDate: "",
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
