import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/data/network/cobe_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final absenceRepositoryProvider = Provider<AbsenceRepository>(
    (ref) => AbsenceRepository(ref.read(cobeApiProvider)));

class AbsenceRepository {
  final CobeApi _cobeApi;
  AbsenceRepository(this._cobeApi);

  Future<List<LeaveRequest>> getAbsences() async {
    //TODO: implenet try catch for parsing
    await Future.delayed(const Duration(seconds: 2));
    final response = await _cobeApi.getAbesences();
    final absenceList =
        (response.data as List).map((e) => LeaveRequest.fromJson(e)).toList();
    return absenceList;
  }

  Future<void> approveAbsence(String id) async =>
      await _cobeApi.approveAbsence(id);

  Future<void> rejectAbsence(String id) async =>
      await _cobeApi.rejectAbsence(id);

  Future<void> addAbsence(LeaveRequest leaveRequest) async =>
      await _cobeApi.createAbsence(leaveRequest.toJson());

  Future<void> resetAbsences() async => await _cobeApi.resetAbsences();
}
