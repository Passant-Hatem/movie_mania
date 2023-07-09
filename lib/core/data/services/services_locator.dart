import 'package:get_it/get_it.dart';
import 'package:movie_mania/movies/movie_details/data/default_movie_details_repository.dart';
import 'package:movie_mania/movies/movie_details/data/remote_service.dart';
import 'package:movie_mania/movies/movie_details/domain/movie_detail_repository.dart';
import 'package:movie_mania/movies/movie_list/data/default_movie_repository.dart';

import '../../../movies/movie_details/domain/get_movie_details.dart';
import '../../../movies/movie_details/domain/get_recommendation.dart';
import '../../../movies/movie_details/presentation/controller/movie_details_bloc.dart';
import '../../../movies/movie_list/data/remote_service.dart';
import '../../../movies/movie_list/domain/get_now_playing_movies.dart';
import '../../../movies/movie_list/domain/get_popular_movies.dart';
import '../../../movies/movie_list/domain/get_top_rated_movies.dart';
import '../../../movies/movie_list/domain/movie_repository.dart';
import '../../../movies/movie_list/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMovies(sl()));
    sl.registerLazySingleton(() => GetPopularMovies(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovies(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<MoviesRepository>(
        () => DefaultMoviesRepository(sl()));
    sl.registerLazySingleton<MovieDetailsRepository>(
        () => DefaultMoviesDetailsRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<MovieRemoteDataSource>(
        () => DefaultMovieRemoteDataSource());
    sl.registerLazySingleton<MovieDetailsRemoteDataSorce>(
        () => DefaultMovieDetailsRemoteDataSource());
  }
}
