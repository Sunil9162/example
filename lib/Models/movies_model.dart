class MoviesModel {
  final int id;
  final String name;
  final String year;
  final String director;
  final String mainstar;
  final String description;
  final int favoritedbyusers;
  final List<dynamic> genres;
  final String thumbnail;

  MoviesModel({
    required this.id,
    required this.name,
    required this.year,
    required this.director,
    required this.mainstar,
    required this.description,
    required this.favoritedbyusers,
    required this.genres,
    required this.thumbnail,
  });

  factory MoviesModel.fromjson(Map<String, dynamic> json) {
    return MoviesModel(
      id: json["id"],
      name: json["name"],
      year: json["year"],
      director: json["director"],
      mainstar: json["main_star"],
      description: json["description"],
      favoritedbyusers: json["favorited_by_users"],
      genres: json["genres"],
      thumbnail: json["thumbnail"]
          .toString()
          .replaceAll("thumb", "medium")
          .replaceAll("mediumnails", "thumbnails"),
    );
  }
}
