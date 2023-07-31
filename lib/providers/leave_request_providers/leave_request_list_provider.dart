import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

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
