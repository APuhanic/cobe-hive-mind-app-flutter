import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/data/repository/absence_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final absenceListProvider =
    StateNotifierProvider<AbsenceListNotifier, List<LeaveRequest>>(
        (ref) => AbsenceListNotifier(ref.read(absenceRepositoryProvider)));

class AbsenceListNotifier extends StateNotifier<List<LeaveRequest>> {
  AbsenceListNotifier(this.absenceRepository) : super([]) {
    getAbsences();
  }
  final AbsenceRepository absenceRepository;

  Future<void> getAbsences() async =>
      await absenceRepository.getAbsences().then((value) => state = value);

  Future<void> addAbsence(LeaveRequest leaveRequest) async =>
      await absenceRepository.addAbsence(leaveRequest);

  Future<void> approveAbsence(String id) async {
    await absenceRepository.approveAbsence(id);
    state = [
      for (final absence in state)
        absence.id == id ? absence.copyWith(isApproved: true) : absence
    ];
  }

  Future<void> rejectAbsence(String id) async {
    await absenceRepository.rejectAbsence(id);
    state = [
      for (final absence in state)
        absence.id == id ? absence.copyWith(isApproved: false) : absence
    ];
  }
}

final absenceListPendingProvider = Provider((ref) => ref
    .watch(absenceListProvider)
    .where((absence) => absence.isApproved == false)
    .toList());

final absenceListApprovedProvider = Provider((ref) => ref
    .watch(absenceListProvider)
    .where((absence) => absence.isApproved == true)
    .toList());
