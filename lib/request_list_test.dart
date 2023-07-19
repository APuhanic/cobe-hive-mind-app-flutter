import 'package:cobe_hive_mobile_app/leave_request.dart';

abstract class LeaveRequestListTest {
  static final List<LeaveRequest> leaveRequests = [
    LeaveRequest(
        user: 'Johhny',
        viewPermission: ViewPermission.everyone,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        reason: 'Reason is ...',
        leaveType: LeaveType.parental),
    LeaveRequest(
        user: 'Bobby',
        viewPermission: ViewPermission.everyone,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        reason: 'Reason is ...',
        leaveType: LeaveType.parental),
    LeaveRequest(
        user: 'Bobby',
        viewPermission: ViewPermission.everyone,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        reason: 'Reason is ...',
        leaveType: LeaveType.parental),
    LeaveRequest(
        user: 'Bobby',
        viewPermission: ViewPermission.everyone,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        reason: 'Reason is ...',
        leaveType: LeaveType.parental),
    LeaveRequest(
        user: 'Bobby',
        viewPermission: ViewPermission.everyone,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        reason: 'Reason is ...',
        leaveType: LeaveType.parental),
  ];
}
