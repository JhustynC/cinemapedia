import 'package:cinemapedia/domain/entitties/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_providers.dart';

final moviesSlideShowProvider = Provider<List<Movie>>(
  (ref) {
    final nowPlayingMoivies = ref.watch(nowPlayingMoviesProvider);

    if (nowPlayingMoivies.isEmpty) {
      return [];
    }

    return nowPlayingMoivies.sublist(0, 6);
  },
);
