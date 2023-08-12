import 'package:cinemapedia/domain/entitties/movie.dart';

abstract class MovieDatasource {
  Future<List<Movie>> getPlayinMovies({int page = 1});
}
