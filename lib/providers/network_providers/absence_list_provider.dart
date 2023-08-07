import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/data/repository/absence_repository.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/absence_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final absenceListProvider =
    StateNotifierProvider<AbsenceListNotifier, List<LeaveRequest>>(
        (ref) => AbsenceListNotifier(ref.read(absenceRepositoryProvider)));

class AbsenceListNotifier extends StateNotifier<List<LeaveRequest>> {
  AbsenceListNotifier(this.absenceRepository) : super([]) {
    getAbsences();
  }
  final AbsenceRepository absenceRepository;

  Future<void> getAbsences() async {
    await absenceRepository.getAbsences().then((value) => state = value);
  }
}
