import '../entitties/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPlayinMovies({int page = 1});
}
