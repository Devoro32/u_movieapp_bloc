import 'package:u_movieapp_bloc/export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesBloc = getIt<MoviesBloc>();
    final favoriteBloc = getIt<FavoritesBloc>();
    final navigationService = getIt<NavigationService>();
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<MoviesBloc, MoviesState>(
            bloc: moviesBloc..add(FetchMoviesEvent()),
            listener: (context, state) {
              if (state is MoviesLoadedState &&
                  favoriteBloc.state is FavoritesLoaded) {
                navigationService.navigateReplace(const MoviesScreen());
              } else if (state is MoviesErrorState) {
                navigationService.showSnackbar(state.message);
              }
            },
          ),
          BlocListener<FavoritesBloc, FavoritesState>(
            bloc: favoriteBloc..add(LoadFavorites()),
            listener: (context, state) {
              if (state is FavoritesError) {
                navigationService.showSnackbar(state.message);
              }
            },
          ),
        ],
        child: BlocBuilder<MoviesBloc, MoviesState>(
          bloc: moviesBloc..add(FetchMoviesEvent()),
          builder: (context, state) {
            if (state is MoviesLoadingState) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Loading..."),
                    SizedBox(height: 20),
                    CircularProgressIndicator.adaptive(),
                  ],
                ),
              );
            } else if (state is MoviesErrorState) {
              return MyErrorWidget(
                errorText: state.message,
                retryFunction: () {
                  moviesBloc.add(FetchMoviesEvent());
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
