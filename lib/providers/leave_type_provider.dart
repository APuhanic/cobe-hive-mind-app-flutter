import 'package:cobe_hive_mobile_app/leave_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final viewPermissionProvider =
    StateNotifierProvider<ViewPermissionProvider, ViewPermission>((ref) {
  return ViewPermissionProvider();
});

class ViewPermissionProvider extends StateNotifier<ViewPermission> {
  ViewPermissionProvider() : super(ViewPermission.everyone);

  void setViewPermission(ViewPermission viewPermission) =>
      state = viewPermission;
}

final leaveTypeProvider =
    StateNotifierProvider<LeaveTypeProvider, LeaveType>((ref) {
  return LeaveTypeProvider();
});

class LeaveTypeProvider extends StateNotifier<LeaveType> {
  LeaveTypeProvider() : super(LeaveType.parental);

  void setLeaveType(LeaveType leaveType) => state = leaveType;
}
