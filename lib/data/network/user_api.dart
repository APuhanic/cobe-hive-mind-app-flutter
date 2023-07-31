import 'package:cobe_hive_mobile_app/data/network/dio_client.dart';
import 'package:cobe_hive_mobile_app/data/constants/endpoints.dart';
import 'package:dio/dio.dart';

class UserApi {
  final DioClient _dioClient;

  UserApi(this._dioClient);

  Future<Response> login(String email, String password) async {
    final Response response = await _dioClient.post(
      Endpoints.login,
      {
        'email': email,
        'password': password,
      },
    );
    return response;
  }

  Future<Response> getUsers() async {
    final Response response = await _dioClient.get(Endpoints.users);
    return response;
  }
}
