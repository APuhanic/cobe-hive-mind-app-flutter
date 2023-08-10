import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/providers/create_request_screen_providers/leave_reason_provider.dart';
import 'package:cobe_hive_mobile_app/providers/create_request_screen_providers/leave_type_provider.dart';
import 'package:cobe_hive_mobile_app/providers/create_request_screen_providers/view_permission_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

final leaveRequestOptionsProvider = Provider.autoDispose((ref) {
  final leaveType = ref.watch(leaveTypeProvider);
  final leaveReason = ref.watch(leaveReasonProvider);
  final viewPermission = ref.watch(viewPermissionProvider);

  return LeaveRequest(
    viewPermission: viewPermission,
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 1)),
    reason: leaveReason,
    leaveType: leaveType,
    isApproved: false,
    id: const Uuid().v4(),
  );
});
