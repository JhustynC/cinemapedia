import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource_imp.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este repositorio es inmutable (provider de solo lectura)
final movieRepositoryProvider = Provider((ref) {
  return MovieResopistoryImp(datasource: MovieDbDatasourceImp());
});
