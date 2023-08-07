import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/data/network/cobe_api.dart';
import 'package:dio/dio.dart';

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
}
