import 'package:cobe_hive_mobile_app/widgets/expandable_fab.dart';
import 'package:cobe_hive_mobile_app/widgets/request_board_header.dart';
import 'package:cobe_hive_mobile_app/widgets/approvedd_request_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestBoardApprovedScreen extends ConsumerWidget {
  const RequestBoardApprovedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: ExpandableFAB(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 40, top: 18),
              child: RequestBoardHeader(),
            ),
            Row(
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
              child: ApprovedRequestList(),
            ),
          ],
        ),
      ),
    );
  }
}
