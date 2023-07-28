import 'package:cobe_hive_mobile_app/data/network/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  final Dio _dio;

  static const _token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjg4MTMwNjk3fQ.BL5VySvQpG4X8nxGtBLymJzvCMpWhg8oxiWrJbLGEWM';

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.responseType = ResponseType.json;
  }

  Future<Response> get(String path) async {
    return _dio.get(
      path,
      options: Options(
        headers: {
          'authorization': _token,
        },
      ),
    );
  }

  Future<Response> post(String path, dynamic data) async {
    debugPrint(path);
    return _dio.post(
      path,
      data: data,
      options: Options(
        headers: {
          'authorization': _token,
        },
      ),
    );
  }

  Future<Response> put(String path, dynamic data) async {
    return _dio.put(
      path,
      data: data,
      options: Options(
        headers: {
          'authorization': _token,
        },
      ),
    );
  }

  Future<Response> delete(String path) async {
    return _dio.delete(
      path,
      options: Options(
        headers: {
          'authorization': _token,
        },
      ),
    );
  }

  Future<Response> patch(String path, dynamic data) async {
    return _dio.patch(
      path,
      data: data,
      options: Options(
        headers: {
          'authorization': _token,
        },
      ),
    );
  }
}
