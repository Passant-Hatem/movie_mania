import 'package:movie_mania/movies/movie_details/data/models/genres_response.dart';
import '../../domain/models/movie_details.dart';

class MovieDetailsResponse extends MovieDetail {
  const MovieDetailsResponse({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      MovieDetailsResponse(
        backdropPath: json["backdrop_path"],
        genres: List<GenresResponse>.from(
            json["genres"].map((x) => GenresResponse.fromJson(x))),
        id: json["id"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        runtime: json["runtime"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
