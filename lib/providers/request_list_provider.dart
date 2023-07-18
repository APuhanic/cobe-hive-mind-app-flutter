import 'package:cobe_hive_mobile_app/leave_request.dart';
import 'package:cobe_hive_mobile_app/request_list_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final leaveRequestListProvider = Provider<List<LeaveRequest>>((ref) {
  return LeaveRequestListTest.leaveRequests;
});
