import 'package:hooks_riverpod/hooks_riverpod.dart';

final leaveReasonProvider =
    StateNotifierProvider<LeaveReasonProvider, String>((ref) {
  return LeaveReasonProvider();
});

class LeaveReasonProvider extends StateNotifier<String> {
  LeaveReasonProvider() : super('');

  void setLeaveReason(String reason) => state = reason;
}
