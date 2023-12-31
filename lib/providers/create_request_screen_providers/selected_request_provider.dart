import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedLeaveRequestProvider = StateProvider<LeaveRequest>(
  (ref) => LeaveRequest(
    id: '',
    requestingUserId: '',
    viewPermission: ViewPermission.everyone,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    reason: '',
    leaveType: LeaveType.other,
    isApproved: false,
  ),
);
