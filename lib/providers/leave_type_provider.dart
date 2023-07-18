import 'package:cobe_hive_mobile_app/leave_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final leaveTypeProvider =
    StateNotifierProvider<LeaveTypeProvider, LeaveType>((ref) {
  return LeaveTypeProvider();
});

class LeaveTypeProvider extends StateNotifier<LeaveType> {
  LeaveTypeProvider() : super(LeaveType.parental);

  void setLeaveType(LeaveType leaveType) => state = leaveType;
}
