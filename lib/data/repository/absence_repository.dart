import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/data/network/cobe_api.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/cobe_api_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final absenceRepositoryProvider = Provider<AbsenceRepository>(
    (ref) => AbsenceRepository(ref.read(cobeApiProvider)));

class AbsenceRepository {
  final CobeApi _cobeApi;
  AbsenceRepository(this._cobeApi);

  Future<List<LeaveRequest>> getAbsences() async {
    try {
      final response = await _cobeApi.getAbesences();
      final absenceList =
          (response.data as List).map((e) => LeaveRequest.fromJson(e)).toList();
      return absenceList;
    } on DioException catch (e) {
      final errorMessage = e.toString();
      throw errorMessage;
    }
  }

  Future<void> approveAbsence(String id) async {
    try {
      await _cobeApi.approveAbsence(id);
    } on DioException catch (e) {
      final errorMessage = e.toString();
      throw errorMessage;
    }
  }

  Future<void> rejectAbsence(String id) async {
    try {
      await _cobeApi.rejectAbsence(id);
    } on DioException catch (e) {
      final errorMessage = e.toString();
      throw errorMessage;
    }
  }

  Future<void> addAbsence(LeaveRequest leaveRequest) async {
    try {
      await _cobeApi.createAbsence(leaveRequest.toJson());
    } on DioException catch (e) {
      final errorMessage = e.toString();
      throw errorMessage;
    }
  }
}
