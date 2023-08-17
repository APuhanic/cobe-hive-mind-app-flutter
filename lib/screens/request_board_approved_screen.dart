import 'package:cobe_hive_mobile_app/data/repository/absence_repository.dart';
import 'package:cobe_hive_mobile_app/widgets/expandable_fab.dart';
import 'package:cobe_hive_mobile_app/widgets/request_board/request_board_header.dart';
import 'package:cobe_hive_mobile_app/widgets/request_board/approved_request_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestBoardApprovedScreen extends ConsumerWidget {
  const RequestBoardApprovedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: const ExpandableFAB(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 40, top: 18),
              child: RequestBoardHeader(),
            ),
            Row(
              children: [
                const Text(
                  'Approved',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Expanded(child: SizedBox(height: 30)),
                TextButton(
                  onPressed: () {
                    ref.read(absenceRepositoryProvider).resetAbsences();
                    ref.read(absenceRepositoryProvider).getAbsences();
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3F51B5),
                    ),
                  ),
                )
              ],
            ),
            const Expanded(child: ApprovedRequestList()),
          ],
        ),
      ),
    );
  }
}
