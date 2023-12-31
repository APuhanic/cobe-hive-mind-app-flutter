import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final leaveTypeProvider =
    StateProvider.autoDispose<LeaveType>((ref) => LeaveType.parental);

final isLeaveSelectedProvider = Provider.autoDispose.family<bool, LeaveType>(
    (ref, leaveType) => leaveType == ref.watch(leaveTypeProvider));
