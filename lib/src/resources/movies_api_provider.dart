
import 'package:dio/dio.dart';
import 'package:movies_app/src/core/base_api.dart';
import 'package:movies_app/src/models/movies_model.dart';

class MoviesApiProvider {
  Future<MoviesModel> fetchMoviesList(String category) async {
    final Response response =
        await BaseApi().getRequest(endPoint: "/3/movie/$category");
    return MoviesModel.fromJson(response.data);
  }
}
