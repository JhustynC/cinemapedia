import 'package:cinemapedia/domain/entitties/movie.dart';
import 'movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  //referencia a la funcion
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies,
  );
});

final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies =
      ref.watch(movieRepositoryProvider).getPopular; //referencia a la funcion
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies,
  );
});

final topRatedMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies =
      ref.watch(movieRepositoryProvider).getTopRated; //referencia a la funcion
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies,
  );
});

final upcomingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies =
      ref.watch(movieRepositoryProvider).getUpcoming; //referencia a la funcion
  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies,
  );
});

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallBack fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];

    //!para esperar un poco al hacer la siguiente peticion
    Future.delayed(const Duration(microseconds: 300));
    isLoading = false;
  }
}
