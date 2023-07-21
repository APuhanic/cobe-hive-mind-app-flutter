import 'package:cobe_hive_mobile_app/providers/leave_request_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/expandable_fab.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_list.dart';
import 'package:cobe_hive_mobile_app/widgets/request_board_header.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestBoardApprovedScreen extends ConsumerWidget {
  const RequestBoardApprovedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 40, top: 18),
              child: RequestBoardHeader(),
            ),
            const Row(
              children: [
                Text(
                  'Approved',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  height: 30,
                )),
              ],
            ),
            Expanded(
              child: LeaveRequestStatusList(
                leaveRequestList: ref.watch(leaveRequestListApprovedProvider),
                axis: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const ExpandableFAB(),
    );
  }
}
