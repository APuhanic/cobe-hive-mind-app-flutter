enum ViewPermission { everyone, admin }

enum LeaveType { parental, sick, vacation, other }

class LeaveRequest {
  String user;
  ViewPermission viewPermission;
  DateTime startDate;
  DateTime endDate;
  String reason;
  LeaveType leaveType;

  LeaveRequest({
    required this.user,
    required this.viewPermission,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.leaveType,
  });
}
