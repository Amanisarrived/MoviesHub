import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_serch_model.dart';
import 'package:movie_app/models/movies_model.dart'; // MovieModel
import 'package:movie_app/network/movies_services.dart';

class MovieProvider extends ChangeNotifier {
  final MoviesServices _services =
      MoviesServices(); // MoviesServices ka instance

  List<MoviesModel> _popularMovies = [];
  List<MoviesModel> _latestMovies = [];
  List<MovieSerchModel> _serchmovies = [];
  bool _isLoadingPopular = false;
  bool _isLoadingLatest = false;
  bool _isLoadingserch = false;

  String? _errorPopular;
  String? _errorLatest;
  String? _errorserch;

  // Getters: Ye data hum UI mein dikhane ke liye use karenge
  List<MoviesModel> get popularMovies => _popularMovies;
  List<MoviesModel> get latestMovies => _latestMovies;
  List<MovieSerchModel> get serchmovies => _serchmovies;
  bool get isLoadingPopular => _isLoadingPopular;
  bool get isLoadingLatest => _isLoadingLatest;
  bool get isloadingserch => _isLoadingserch;
  String? get errorPopular => _errorPopular;
  String? get errorLatest => _errorLatest;
  String? get errorserch => _errorserch;

  // Popular movies fetch karne ka method
  Future<void> fetchPopularMovies() async {
    _isLoadingPopular = true;
    _errorPopular = null;
    notifyListeners(); // UI ko batao, loading shuru ho gayi

    try {
      _popularMovies = await _services
          .fetchPopularMovies(); // API se data fetch kiya
    } catch (e) {
      _errorPopular = e.toString(); // Agar koi error aaya
    } finally {
      _isLoadingPopular = false;
      notifyListeners(); // UI ko batao, loading khatam ho gayi (chahe data aaya ya error)
    }
  }

  // Latest movies fetch karne ka method (Same logic)
  Future<void> fetchLatestMovies() async {
    _isLoadingLatest = true;
    _errorLatest = null;
    notifyListeners();

    try {
      _latestMovies = await _services.fetchLatestmovies();
    } catch (e) {
      _errorLatest = e.toString();
    } finally {
      _isLoadingLatest = false;
      notifyListeners();
    }
  }

  // Sabhi movies ko refresh karne ka method (agar zaroorat ho)
  Future<void> refreshAllMovies() async {
    await Future.wait([fetchPopularMovies(), fetchLatestMovies()]);
  }

  Future<void> serchMovie(String movieserch) async {
    _isLoadingserch = true;
    _errorserch = null;
    notifyListeners();

    try {
      _serchmovies = await _services.searchMovies(movieserch);
    } catch (e) {
      _errorserch = e.toString();
    } finally {
      _isLoadingserch = false;
      notifyListeners();
    }
  }

  void clearSearchResults() {
    _serchmovies = [];
    _errorserch = null;
    notifyListeners();
  }

  void clearSearch() {
    serchmovies.clear();
    notifyListeners();
  }
}
