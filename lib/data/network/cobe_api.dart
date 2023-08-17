import 'package:cobe_hive_mobile_app/data/network/dio_client.dart';
import 'package:cobe_hive_mobile_app/data/constants/endpoints.dart';
import 'package:dio/dio.dart';

class CobeApi {
  final DioClient _dioClient;

  CobeApi(this._dioClient);

  Future<Response> login(String email, String password) async =>
      await _dioClient.post(
        Endpoints.login,
        {
          'email': email,
          'password': password,
        },
      );

  Future<Response> refreshToken(String refreshToken, String userId) async =>
      await _dioClient.post(
        Endpoints.refresh,
        {
          'refresh': refreshToken,
          'user_id': userId,
        },
      );

  Future<Response> getUsers() async => await _dioClient.get(Endpoints.users);

  Future<Response> getUserById(String id) async =>
      await _dioClient.get('${Endpoints.users}/$id');

  Future<Response> getAbesences() async =>
      await _dioClient.get(Endpoints.absence);

  Future<Response> approveAbsence(String id) async =>
      await _dioClient.patch('${Endpoints.absence}/$id/approve', id);

  Future<Response> createAbsence(Map<String, dynamic> absence) async =>
      await _dioClient.post(Endpoints.absence, absence);

  Future<Response> rejectAbsence(String id) async =>
      await _dioClient.delete('${Endpoints.absence}/$id/delete');

  Future<Response> resetAbsences() async =>
      await _dioClient.delete(Endpoints.reset);
}
