import 'package:cobe_hive_mobile_app/data/leave_request.dart';
import 'package:cobe_hive_mobile_app/providers/leave_reason_provider.dart';
import 'package:cobe_hive_mobile_app/providers/leave_type_provider.dart';
import 'package:cobe_hive_mobile_app/providers/view_permission_provider.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

final leaveRequestOptionsProvider = Provider.autoDispose((ref) {
  final leaveType = ref.watch(leaveTypeProvider);
  final leaveReason = ref.watch(leaveReasonProvider);
  final viewPermission = ref.watch(viewPermissionProvider);

  return LeaveRequest(
    user: 'john',
    viewPermission: viewPermission,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    reason: leaveReason,
    leaveType: leaveType,
    status: RequestStatus.pending,
    id: const Uuid().v4(),
  );
});

final leaveRequestListProvider =
    StateNotifierProvider<LeaveRequestListProvider, List<LeaveRequest>>(
        (ref) => LeaveRequestListProvider());

class LeaveRequestListProvider extends StateNotifier<List<LeaveRequest>> {
  LeaveRequestListProvider() : super([]);

  void addLeaveRequest(LeaveRequest leaveRequest) {
    state = [...state, leaveRequest];
  }

  void approveLeaveRequest(LeaveRequest leaveRequest) {
    state = [
      for (final request in state)
        request.id == leaveRequest.id
            ? request.copyWith(status: RequestStatus.approved)
            : request
    ];
  }
}

final leaveRequestListPendingProvider = Provider((ref) {
  final leaveRequestList = ref.watch(leaveRequestListProvider);
  return leaveRequestList
      .where((leaveRequest) => leaveRequest.status == RequestStatus.pending)
      .toList();
});

final leaveRequestListApprovedProvider = Provider((ref) {
  final leaveRequestList = ref.watch(leaveRequestListProvider);
  return leaveRequestList
      .where((leaveRequest) => leaveRequest.status == RequestStatus.approved)
      .toList();
});
