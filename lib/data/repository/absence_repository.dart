import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/data/network/cobe_api.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/connectivity_status_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final absenceRepositoryProvider = Provider<AbsenceRepository>(
    (ref) => AbsenceRepository(ref.read(cobeApiProvider), ref));

class AbsenceRepository {
  final CobeApi _cobeApi;
  final Ref ref;
  AbsenceRepository(this._cobeApi, this.ref);

  Future<List<LeaveRequest>> getAbsences() async {
    if (await ref
            .read(connectivityStatusProvider.notifier)
            .checkConnectivity() ==
        ConnectivityStatus.isConnected) {
      return getAbsencesFromApi();
    }
    return getAbsencesFromHive();
  }

  Future<void> approveAbsence(String id) async =>
      await _cobeApi.approveAbsence(id);

  Future<void> rejectAbsence(String id) async =>
      await _cobeApi.rejectAbsence(id);

  Future<void> addAbsence(LeaveRequest leaveRequest) async =>
      await _cobeApi.createAbsence(leaveRequest.toJson());

  Future<void> resetAbsences() async => await _cobeApi.resetAbsences();

  Future<List<LeaveRequest>> getAbsencesFromApi() async {
    try {
      final response = await _cobeApi.getAbesences();
      final absenceList =
          (response.data as List).map((e) => LeaveRequest.fromJson(e)).toList();
      return absenceList;
    } catch (e) {
      debugPrint('Error during API call or JSON parsing: $e');
      return [];
    }
  }

  Future<List<LeaveRequest>> getAbsencesFromHive() async =>
      Hive.box<LeaveRequest>('absences').values.toList();
}
