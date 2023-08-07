import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedLeaveRequestProvider = StateProvider<LeaveRequest>((ref) {
  return LeaveRequest(
    id: '',
    viewPermission: ViewPermission.everyone,
    startDate: '',
    endDate: '',
    reason: '',
    leaveType: LeaveType.other,
    status: RequestStatus.pending,
  );
});
