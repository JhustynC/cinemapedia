import 'package:cinemapedia/domain/datasources/movie_datasource.dart';
import 'package:cinemapedia/domain/entitties/movie.dart';

import '../../domain/repositories/movie_repository.dart';

class MovieResopistoryImp extends MoviesRepository {
  final MoviesDatasource datasource;
  MovieResopistoryImp({required this.datasource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }
}
