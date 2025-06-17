class MovieSerchModel {
  const MovieSerchModel({
    required this.title,
    required this.rating,
    required this.overview,
    required this.poster,
  });
  final String title;
  final double rating;
  final String overview;
  final String poster;

  factory MovieSerchModel.fromJson(Map<String, dynamic> json) {
    return MovieSerchModel(
      title: json["title"] ?? "",
      rating: (json["vote_average"] ?? 0).toDouble(),
      overview: json["overview"],
      poster: json["poster_path"] ?? "",
    );
  }
}
