import 'package:movies_app/src/models/movies_model.dart';
import 'package:movies_app/src/resources/movies_api_provider.dart';

class MoviesRepository {
  final moviesProvider = MoviesApiProvider();

  Future<MoviesModel> fetchAllMovies(String category) async =>
      await moviesProvider.fetchMoviesList(category);
}
