import 'package:cobe_hive_mobile_app/providers/create_request_screen_providers/selected_request_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/request_board/request_details_status_card.dart';
import 'package:cobe_hive_mobile_app/widgets/request_details_screen_widgets/leave_date.dart';
import 'package:cobe_hive_mobile_app/widgets/request_details_screen_widgets/leave_reason.dart';
import 'package:cobe_hive_mobile_app/widgets/request_details_screen_widgets/reject_approve_buttons.dart';
import 'package:cobe_hive_mobile_app/widgets/request_details_screen_widgets/request_details_header.dart';
import 'package:cobe_hive_mobile_app/widgets/request_details_screen_widgets/user_details.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestDetailsScreen extends ConsumerWidget {
  const RequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLeaveRequest = ref.watch(selectedLeaveRequestProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 40),
              child: RequestDetailsHeader(),
            ),
            UserDetails(selectedLeaveRequest.requestingUserId),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: RequestDetailsStatusCard(),
            ),
            const LeaveDate(),
            LeaveReason(leaveRequest: selectedLeaveRequest),
            Expanded(child: Container()),
            RejectApproveButtons(leaveRequest: selectedLeaveRequest),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
