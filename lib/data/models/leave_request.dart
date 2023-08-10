import 'package:intl/intl.dart';

enum ViewPermission { everyone, admin }

enum LeaveType { parental, sick, vacation, other }

enum RequestStatus { pending, approved, rejected }

class LeaveRequest {
  String? id;
  ViewPermission? viewPermission;
  DateTime? startDate;
  DateTime? endDate;
  String? reason;
  LeaveType? leaveType;
  bool? isApproved;

  LeaveRequest({
    required this.id,
    required this.viewPermission,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.leaveType,
    required this.isApproved,
  });

  LeaveRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    viewPermission = _convertToViewPermission(json['viewPermission']);
    startDate = DateFormat("'yyyy-MM-ddTHH:mm:ss.SSS").parse(json['start']);
    endDate = DateFormat("'yyyy-MM-ddTHH:mm:ss.SSS").parse(json['end']);
    reason = json['reason'];
    leaveType = _convertToLeaveType(json['type']);
    isApproved = json['approved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['viewPermission'] = viewPermission.toString().split('.').last;
    data['start'] = DateFormat('yyyy-MM-dd').format(startDate!);
    data['end'] = DateFormat('yyyy-MM-dd').format(endDate!);
    data['reason'] = reason;
    data['type'] = leaveType.toString().split('.').last;
    data['approved'] = isApproved;
    return data;
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
    DateTime? startDate,
    DateTime? endDate,
    String? reason,
    LeaveType? leaveType,
    bool? isApproved,
  }) =>
      LeaveRequest(
        id: id ?? this.id,
        endDate: endDate ?? this.endDate,
        leaveType: leaveType ?? this.leaveType,
        reason: reason ?? this.reason,
        startDate: startDate ?? this.startDate,
        isApproved: isApproved ?? this.isApproved,
        viewPermission: viewPermission ?? this.viewPermission,
      );

  String getStartMonth() => DateFormat('MMM').format(startDate!);

  String getEndMonth() => DateFormat('MMM').format(endDate!);

  int getDuration() => endDate!.difference(startDate!).inDays;
}
