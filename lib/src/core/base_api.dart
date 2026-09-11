import 'package:dio/dio.dart';
import 'package:movies_app/src/core/constants.dart';

class BaseApi {
  static late Dio _dio;

  static Future<void> initializeDio({String? readAccessToken}) async {
    final token = readAccessToken ?? Constants.tmdbReadAccessToken;
    if (token.isEmpty) {
      throw StateError(
        'Missing TMDB_READ_ACCESS_TOKEN. Pass it with --dart-define when running the app.',
      );
    }

    _dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(endPoint, queryParameters: queryParameters);
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!;
      }
      throw StateError('Network request failed: ${e.message}');
    }
  }
}
