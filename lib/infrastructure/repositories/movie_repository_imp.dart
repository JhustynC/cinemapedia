import 'package:cinemapedia/domain/datasources/movie_datasource.dart';
import 'package:cinemapedia/domain/entitties/movie.dart';

import '../../domain/repositories/movie_repository.dart';

class MovieResopistoryImp extends MoviesRepository {
  final MoviesDatasource datasource;
  MovieResopistoryImp({required this.datasource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying();
  }
}
