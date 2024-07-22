import 'package:dio/dio.dart';
import 'package:movies_app/src/core/constants.dart';

class BaseApi {
  static late Dio _dio;
  static late Response _response;

  static Future<void> initializeDio() async {
    _dio = Dio(BaseOptions(baseUrl: Constants.baseUrl,
    headers: {
      "Authorization" : Constants.READ_ACCESS_TOKEN,
    }
    ));
  }

}
