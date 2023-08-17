import 'package:cobe_hive_mobile_app/data/models/api_state.dart';
import 'package:cobe_hive_mobile_app/data/models/dio_exceptions.dart';
import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/data/repository/absence_repository.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/absence_list_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final absenceControllerProvider =
    StateNotifierProvider<AbsenceNotifier, ApiState<LeaveRequest>>(
        (ref) => AbsenceNotifier(ref));

class AbsenceNotifier extends StateNotifier<ApiState<LeaveRequest>> {
  AbsenceNotifier(this.ref) : super(const ApiState.initial());
  final Ref ref;

  addAbsence(LeaveRequest leaveRequest) async {
    try {
      state = const ApiState.loading(null);
      await ref.read(absenceRepositoryProvider).addAbsence(leaveRequest);
      state = ApiState.success(leaveRequest);
    } on DioException catch (e) {
      state = ApiState.error(DioExceptions.fromDioError(e).message);
    }
  }

  approveAbsence(LeaveRequest leaveRequest) async {
    try {
      state = const ApiState.loading(null);
      await ref
          .read(absenceRepositoryProvider)
          .approveAbsence(leaveRequest.id!);
      state = ApiState.success(leaveRequest);
      ref.read(absenceListProvider.notifier).approveAbsence(leaveRequest.id!);
    } on DioException catch (e) {
      state = ApiState.error(DioExceptions.fromDioError(e).message);
    }
  }

  rejectAbsence(LeaveRequest leaveRequest) async {
    try {
      state = const ApiState.loading(null);
      await ref.read(absenceRepositoryProvider).rejectAbsence(leaveRequest.id!);
      state = ApiState.success(leaveRequest);
      ref.read(absenceListProvider.notifier).rejectAbsence(leaveRequest.id!);
    } on DioException catch (e) {
      state = ApiState.error(DioExceptions.fromDioError(e).message);
    }
  }
}
