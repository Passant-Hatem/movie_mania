import 'package:get_it/get_it.dart';
import 'package:movie_mania/movies/movie_list/data/default_movie_repository.dart';

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

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMovies(sl()));
    sl.registerLazySingleton(() => GetPopularMovies(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovies(sl()));

    /// Repository
    sl.registerLazySingleton<MoviesRepository>(
        () => DefaultMoviesRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<MovieRemoteDataSource>(
        () => DefaultMovieRemoteDataSource());
  }
}
