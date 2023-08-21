import 'package:cobe_hive_mobile_app/data/constants/endpoints.dart';
import 'package:cobe_hive_mobile_app/data/network/interceptors/token_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class BaseDioClient {
  final Dio _dio;
  BaseDioClient(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.responseType = ResponseType.json
      ..interceptors.add(PrettyDioLogger());
  }
  Future<Response> post(String path, dynamic data) async => _dio.post(
        path,
        data: data,
      );
  Future<Response> get(String path) async => _dio.get(path);

  Future<Response> put(String path, dynamic data) async =>
      _dio.put(path, data: data);

  Future<Response> delete(String path) async =>
      _dio.delete(path, options: Options());

  Future<Response> patch(String path, dynamic data) async => _dio.patch(
        path,
        data: data,
      );
}

class DioClient extends BaseDioClient {
  final Ref ref;

  DioClient(Dio dio, this.ref) : super(dio) {
    _dio.interceptors.add(TokenInterceptor(ref, dio));
  }
}

class DioLoginClient extends BaseDioClient {
  DioLoginClient(Dio dio) : super(dio);
}
