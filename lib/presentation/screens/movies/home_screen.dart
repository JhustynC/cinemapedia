import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_sreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    debugPrint('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return FullScreenLoader();

    final slidePlayingMoivies = ref.watch(moviesSlideShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingrMovies = ref.watch(upcomingMoviesProvider);

    return Visibility(
      visible: !initialLoading,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: CustomAppBar(),
                titlePadding: EdgeInsets.zero,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      //const CustomAppBar(),
                      MoviesSlideShow(movies: slidePlayingMoivies),
                      MovieHorizontalListView(
                        movies: nowPlayingMovies,
                        title: 'En cines',
                        subtitle: 'Lunes 20',
                        loadNextPage: () {
                          ref
                              .read(nowPlayingMoviesProvider.notifier)
                              .loadNextPage();
                        },
                      ),
                      MovieHorizontalListView(
                        movies: topRatedMovies,
                        title: 'Mejor Calificadas',
                        subtitle: 'Lunes 20',
                        loadNextPage: () {
                          ref
                              .read(topRatedMoviesProvider.notifier)
                              .loadNextPage();
                        },
                      ),
                      MovieHorizontalListView(
                        movies: popularMovies,
                        title: 'Populares',
                        subtitle: 'Lunes 20',
                        loadNextPage: () {
                          ref
                              .read(popularMoviesProvider.notifier)
                              .loadNextPage();
                        },
                      ),
                      MovieHorizontalListView(
                        movies: upcomingrMovies,
                        title: 'Proximamente',
                        subtitle: 'Lunes 20',
                        loadNextPage: () {
                          ref
                              .read(upcomingMoviesProvider.notifier)
                              .loadNextPage();
                        },
                      ),
                      const SizedBox(height: 50)
                    ],
                  );
                },
                childCount: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
