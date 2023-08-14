import 'package:cobe_hive_mobile_app/data/models/api_state.dart';
import 'package:cobe_hive_mobile_app/data/models/dio_exceptions.dart';
import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/data/repository/absence_repository.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final absenceListProvider =
    StateNotifierProvider<AbsenceListNotifier, ApiState<List<LeaveRequest>>>(
        (ref) => AbsenceListNotifier(ref.read(absenceRepositoryProvider)));

class AbsenceListNotifier extends StateNotifier<ApiState<List<LeaveRequest>>> {
  AbsenceListNotifier(this.absenceRepository)
      : super(const ApiState.initial()) {
    getAbsences();
  }
  final AbsenceRepository absenceRepository;

  getAbsences() async {
    try {
      const ApiState.loading(null);
      final absenceList = await absenceRepository.getAbsences();
      state = ApiState.success(absenceList);
    } on DioException catch (e) {
      state = ApiState.error(DioExceptions.fromDioError(e).message);
    }
  }

  approveAbsence(String id) async {
    state = state.maybeWhen(
      orElse: () => state,
      success: (leaveRequestList) => ApiState.success([
        for (final leaveRequest in leaveRequestList)
          leaveRequest.id == id
              ? leaveRequest.copyWith(isApproved: true)
              : leaveRequest
      ]),
    );
  }

  rejectAbsence(String id) async {
    state = state.maybeWhen(
      orElse: () => state,
      success: (leaveRequestList) => ApiState.success([
        for (final leaveRequest in leaveRequestList)
          leaveRequest.id == id
              ? leaveRequest.copyWith(isApproved: false)
              : leaveRequest
      ]),
    );
  }
}

final absenceListPendingProvider =
    Provider((ref) => ref.watch(absenceListProvider).maybeWhen(
          orElse: () => [],
          success: (leaveRequestList) => leaveRequestList
              .where((leaveRequest) => leaveRequest.isApproved == false)
              .toList(),
        ));

final absenceListApprovedProvider =
    Provider((ref) => ref.watch(absenceListProvider).maybeWhen(
          orElse: () => [],
          success: (leaveRequestList) => leaveRequestList
              .where((leaveRequest) => leaveRequest.isApproved == true)
              .toList(),
        ));

final absenceListByUserProvider =
    Provider.family((ref, userId) => ref.watch(absenceListProvider).maybeWhen(
          orElse: () => [],
          success: (leaveRequestList) => leaveRequestList
              .where((leaveRequest) => leaveRequest.requestingUserId == userId)
              .toList(),
        ));

final publicAbsenceListProvider =
    Provider.family((ref, userId) => ref.watch(absenceListProvider).maybeWhen(
          orElse: () => [],
          success: (leaveRequestList) => leaveRequestList
              .where((leaveRequest) =>
                  leaveRequest.requestingUserId == userId &&
                  leaveRequest.isApproved == true)
              .toList(),
        ));
