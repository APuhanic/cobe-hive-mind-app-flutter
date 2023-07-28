import 'package:cobe_hive_mobile_app/data/network/dio_client.dart';
import 'package:cobe_hive_mobile_app/data/network/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<Response> login(String email, String password) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.login,
        {
          'email': email,
          'password': password,
        },
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  Future<Response> getUsersApi() async {
    try {
      final Response response = await dioClient.get('/users');
      debugPrint('RESPONSE DATA ${response.data.toString()}');

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
