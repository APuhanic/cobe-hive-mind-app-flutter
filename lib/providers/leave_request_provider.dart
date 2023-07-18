import 'package:cobe_hive_mobile_app/leave_request.dart';
import 'package:cobe_hive_mobile_app/providers/leave_reason_provider.dart';
import 'package:cobe_hive_mobile_app/providers/leave_type_provider.dart';
import 'package:cobe_hive_mobile_app/providers/view_permission_provider.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final leaveRequestProvider = Provider((ref) {
  final leaveType = ref.watch(leaveTypeProvider);
  final leaveReason = ref.watch(leaveReasonProvider);
  final viewPermission = ref.watch(viewPermissionProvider);

  return LeaveRequest(
      user: 'john',
      viewPermission: viewPermission,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      reason: leaveReason,
      leaveType: leaveType);
});

final leaveRequestListProvider =
    StateNotifierProvider<LeaveRequestListProvider, List<LeaveRequest>>(
        (ref) => LeaveRequestListProvider());

class LeaveRequestListProvider extends StateNotifier<List<LeaveRequest>> {
  LeaveRequestListProvider() : super([]);

  void addLeaveRequest(LeaveRequest leaveRequest) {
    state = [...state, leaveRequest];
  }
}
