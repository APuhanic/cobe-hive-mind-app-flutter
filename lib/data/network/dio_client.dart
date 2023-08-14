import 'package:cobe_hive_mobile_app/data/constants/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio;

  static const _token =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYWNkNmI3OWQtODU4Ny00MTk0LWE1ZDgtYWEzNDQ3ZmExYjU1Iiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjkxNzU4MDI2LCJleHAiOjE2OTE3NTg5MjYsInN1YiI6ImFjY2Vzcy10b2tlbiIsImlzcyI6ImNvYmUtaGl2ZSJ9.-Mf0NDCQ9Sd8wngdOLEWKXMRGM-2C9JGKPw3pz4D9GI';

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.responseType = ResponseType.json
      ..interceptors.add(PrettyDioLogger());
  }

  Future<Response> get(String path) async => _dio.get(
        path,
        options: Options(
          headers: {
            'authorization': _token,
          },
        ),
      );

  Future<Response> post(String path, dynamic data) async => _dio.post(
        path,
        data: data,
        options: Options(
          headers: {
            'authorization': _token,
          },
        ),
      );

  Future<Response> put(String path, dynamic data) async => _dio.put(
        path,
        data: data,
        options: Options(
          headers: {
            'authorization': _token,
          },
        ),
      );

  Future<Response> delete(String path) async => _dio.delete(
        path,
        options: Options(
          headers: {
            'authorization': _token,
          },
        ),
      );

  Future<Response> patch(String path, dynamic data) async => _dio.patch(
        path,
        data: data,
        options: Options(
          headers: {
            'authorization': _token,
          },
        ),
      );
}
