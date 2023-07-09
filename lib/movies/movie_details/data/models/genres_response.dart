import '../../domain/models/Genres.dart';

class GenresResponse extends Genres {
  const GenresResponse({
    required super.name,
    required super.id,
  });

  factory GenresResponse.fromJson(Map<String, dynamic> json) => GenresResponse(
        id: json["id"],
        name: json["name"],
      );
}