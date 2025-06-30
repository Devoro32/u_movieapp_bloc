// import 'dart:developer' as logp;

import 'package:u_movieapp_bloc/export.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
              // getIt<NavigationService>().showSnackbar();
              // getIt<NavigationService>().showDialog(MoviesWidget());
              getIt<NavigationService>().navigate(const FavoritesScreen());
            },
            icon: const Icon(MyAppIcons.favoriteRounded, color: Colors.red),
          ),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () async {
                  // context.read<ThemeBloc>().add(ToggleThemeEvent());
                  getIt<ThemeBloc>().add(ToggleThemeEvent());
                },
                icon: Icon(
                  state is DarkThemeState
                      ? MyAppIcons.darkMode
                      : MyAppIcons.lightMode,
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is MoviesErrorState) {
            return Center(child: Text(state.message));
          } else if (state is MoviesLoadedState ||
              state is MoviesLoadingMoreState) {
            final movies = state is MoviesLoadedState
                ? state.movies
                : (state as MoviesLoadingMoreState).movies;
            bool isLoadingMore = state is MoviesLoadingMoreState;
            int itemCount = isLoadingMore ? movies.length + 1 : movies.length;

            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent &&
                    !isLoadingMore) {
                  getIt<MoviesBloc>().add(FetchMoreMoviesEvent());
                  return true;
                }
                return false;
              },
              child: ListView.builder(
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  if (index >= movies.length && isLoadingMore) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return MoviesWidget(movieModel: movies[index]);
                },
              ),
            );
          }

          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}
