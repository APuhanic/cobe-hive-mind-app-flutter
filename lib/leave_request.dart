enum ViewPermission { everyone, admin }

enum LeaveType { parental, sick, vacation, other }

enum RequestStatus { pending, approved, rejected }

class LeaveRequest {
  String id;
  String user;
  ViewPermission viewPermission;
  DateTime startDate;
  DateTime endDate;
  String reason;
  LeaveType leaveType;
  RequestStatus status;

  LeaveRequest({
    required this.id,
    required this.user,
    required this.viewPermission,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.leaveType,
    required this.status,
  });
}
