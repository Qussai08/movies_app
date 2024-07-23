import 'package:dio/dio.dart';
import 'package:movies_app/src/core/constants.dart';

class BaseApi {
  static late Dio _dio;
  static late Response _response;

  static Future<void> initializeDio() async {
    _dio = Dio(BaseOptions(baseUrl: Constants.baseUrl, headers: {
      "Authorization": "Bearer ${Constants.READ_ACCESS_TOKEN}",
    }));
  }

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      _response =
          await _dio.request(endPoint, queryParameters: queryParameters);
      return Response(
          requestOptions: RequestOptions(),
          statusCode: _response.statusCode,
          data: _response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode != null) {
          // if (e.response!.statusCode == 401) {
          //   authService.logout();
          // }
          return Response(
            requestOptions: RequestOptions(),
            statusCode: e.response!.statusCode!,
            statusMessage: e.response!.statusMessage!,
            data: e.response!.data!,
          );
        }
      }
      return _response;
    }
  }
}
