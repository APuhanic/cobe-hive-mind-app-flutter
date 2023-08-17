import 'package:cobe_hive_mobile_app/data/constants/endpoints.dart';
import 'package:cobe_hive_mobile_app/data/network/interceptors/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio;
  final Ref ref;
  DioClient(this._dio, this.ref) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.responseType = ResponseType.json
      ..interceptors.add(PrettyDioLogger())
      ..interceptors.add(TokenInterceptor(ref));
  }

  Future<Response> get(String path) async => _dio.get(path);

  Future<Response> post(String path, dynamic data) async => _dio.post(
        path,
        data: data,
      );

  Future<Response> put(String path, dynamic data) async =>
      _dio.put(path, data: data);

  Future<Response> delete(String path) async =>
      _dio.delete(path, options: Options());

  Future<Response> patch(String path, dynamic data) async => _dio.patch(
        path,
        data: data,
      );
}
