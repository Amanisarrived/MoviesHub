import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie_serch_model.dart';
import 'package:movie_app/models/movies_model.dart';

class MoviesServices {
  final String _baseurl = 'https://api.themoviedb.org/3';
  final String _apiKey = "0ad5a66f8aaae2a50237f0f9fd43a883";

  Future<List<MoviesModel>> fetchPopularMovies() async {
    final url = Uri.parse('$_baseurl/movie/top_rated?api_key=$_apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> results = jsonData["results"];

        return results
            .map((moviejson) => MoviesModel.fromJson(moviejson))
            .toList();
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  Future<List<MoviesModel>> fetchLatestmovies() async {
    final url = Uri.parse('$_baseurl/movie/now_playing?api_key=$_apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> result = jsonData["results"];

        return result
            .map((movieJson) => MoviesModel.fromJson(movieJson))
            .toList();
      } else {
        throw Exception("Failed to load movies : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching movies : $e");
    }
  }

  Future<List<MovieSerchModel>> searchMovies(String movieSerch) async {
    final url = Uri.parse("$_baseurl/search/movie?api_key=$_apiKey&query=$movieSerch");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> result = jsonData["results"];

        return result
            .map((serchResult) => MovieSerchModel.fromJson(serchResult))
            .toList();
      } else {
        throw Exception("Failed to serch movie : ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error while fetching result: $e");
    }
  }
}
