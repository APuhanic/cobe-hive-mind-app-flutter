enum ViewPermission { everyone, admin }

enum LeaveType { parental, sick, vacation, other }

enum RequestStatus { pending, approved, rejected }

class LeaveRequest {
  String? id;
  ViewPermission? viewPermission;
  String? startDate;
  String? endDate;
  String? reason;
  LeaveType? leaveType;
  RequestStatus? status;

  LeaveRequest({
    required this.id,
    required this.viewPermission,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.leaveType,
    required this.status,
  });

  LeaveRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    viewPermission = _convertToViewPermission(json['viewPermission']);
    startDate = json['startDate'];
    endDate = json['endDate'];
    reason = json['reason'];
    leaveType = _convertToLeaveType(json['leaveType']);
    status = _convertToRequestStatus(json['status']);
  }

  LeaveType _convertToLeaveType(leaveType) {
    switch (leaveType) {
      case 'parental':
        return LeaveType.parental;
      case 'sick':
        return LeaveType.sick;
      case 'vacation':
        return LeaveType.vacation;
      case 'other':
        return LeaveType.other;
      default:
        return LeaveType.other;
    }
  }

  RequestStatus _convertToRequestStatus(status) {
    switch (status) {
      case 'pending':
        return RequestStatus.pending;
      case 'approved':
        return RequestStatus.approved;
      case 'rejected':
        return RequestStatus.rejected;
      default:
        return RequestStatus.pending;
    }
  }

  ViewPermission _convertToViewPermission(viewPermission) {
    switch (viewPermission) {
      case 'everyone':
        return ViewPermission.everyone;
      case 'admin':
        return ViewPermission.admin;
      default:
        return ViewPermission.everyone;
    }
  }

  LeaveRequest copyWith({
    String? id,
    String? user,
    ViewPermission? viewPermission,
    String? startDate,
    String? endDate,
    String? reason,
    LeaveType? leaveType,
    RequestStatus? status,
  }) =>
      LeaveRequest(
        id: id ?? this.id,
        endDate: endDate ?? this.endDate,
        leaveType: leaveType ?? this.leaveType,
        reason: reason ?? this.reason,
        startDate: startDate ?? this.startDate,
        status: status ?? this.status,
        viewPermission: viewPermission ?? this.viewPermission,
      );
}
