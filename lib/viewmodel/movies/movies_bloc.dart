import 'package:u_movieapp_bloc/export.dart';
part 'movies_event.dart';
part 'movies_state.dart';

//!95
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<FetchMoviesEvent>(_onFetchMovies);
    on<FetchMoreMoviesEvent>(_onFetchMoreMovies);
  }
  final MoviesRepository _moviesRepository = getIt<MoviesRepository>();

  Future<void> _onFetchMovies(event, emit) async {
    emit(MoviesLoadingState());
    try {
      var genres = await _moviesRepository.fetchGenres();
      // log("genres length ${genres.length}");
      var movies = await _moviesRepository.fetchMovies(page: 1);
      emit(MoviesLoadedState(currentPage: 1, genres: genres, movies: movies));
    } catch (e) {
      emit(MoviesErrorState(message: "Failed to load movies $e"));
    }
  }

  Future<void> _onFetchMoreMovies(event, emit) async {
    final currentState = state;
    if (currentState is MoviesLoadingMoreState) {
      return;
    }
    if (currentState is! MoviesLoadedState) {
      return;
    }
    emit(
      MoviesLoadingMoreState(
        currentPage: currentState.currentPage,
        genres: currentState.genres,
        movies: currentState.movies,
      ),
    );

    try {
      List<MovieModel> movies = await _moviesRepository.fetchMovies(
        page: currentState.currentPage + 1,
      );
      if (movies.isEmpty) {
        emit(currentState);
        return;
      }
      currentState.movies.addAll(movies);
      emit(
        MoviesLoadedState(
          currentPage: currentState.currentPage + 1,
          genres: currentState.genres,
          movies: currentState.movies,
        ),
      );
    } catch (e) {
      emit(MoviesErrorState(message: "Failed to load movies $e"));
    }
  }
}
