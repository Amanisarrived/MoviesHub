class MoviesModel {
  const MoviesModel({
    required this.averageRating,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
  });
  final String title;
  final String overview;
  final String posterPath;
  final double averageRating;
  final String releaseDate;

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      averageRating: (json["vote_average"] ?? 0).toDouble(),
      overview: json["overview"] ?? "No Description",
      posterPath: json["poster_path"] ?? "",
      releaseDate: json["release_date"] ?? "",
      title: json["title"] ?? "",
    );
  }
}
