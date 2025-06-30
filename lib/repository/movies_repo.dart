import 'package:u_movieapp_bloc/export.dart';

class MoviesRepository {
  final ApiService _apiService;
  MoviesRepository(this._apiService);

  Future<List<MovieModel>> fetchMovies({int page = 1}) async {
    return await _apiService.fetchMovies(page: page);
  }

  // List<MoviesGenre> cachedGenres = [];
  Future<List<MoviesGenre>> fetchGenres() async {
    // return cachedGenres = await _apiService.fetchGenres();
    return await _apiService.fetchGenres();
  }
}
