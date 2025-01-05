import 'package:go_router/go_router.dart';

import '../../movies/movie_details/presentation/screens/movie_details_screen.dart';
import '../presentation/main.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MoviesScreenWrapper(),
    ),
    GoRoute(
      path: '/movie/:id', // Dynamic route for movie details
      builder: (context, state) {
        final id = state.pathParameters['id']; // Access the ID from the route
        return MovieDetailScreen(id: int.parse(id!));
      },
    ),
  ],
);