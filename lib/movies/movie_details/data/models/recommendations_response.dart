
import '../../domain/models/recommendations.dart';

class RecommendationResponse extends Recommendation {
  const RecommendationResponse({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationResponse.fromJson(Map<String, dynamic> json) =>
      RecommendationResponse(
        id: json["id"],
        backdropPath:
            json["backdrop_path"] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
      );
}