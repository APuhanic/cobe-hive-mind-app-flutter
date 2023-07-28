import 'package:cobe_hive_mobile_app/data/app_colors.dart';
import 'package:cobe_hive_mobile_app/widgets/expandable_fab.dart';
import 'package:cobe_hive_mobile_app/widgets/requets_to_approve_list.dart';
import 'package:cobe_hive_mobile_app/widgets/request_board_header.dart';
import 'package:flutter/material.dart';

class RequestBoardScreen extends StatelessWidget {
  const RequestBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Pending',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Expanded(
                    child: SizedBox(
                  height: 30,
                )),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/request-board-approved'),
                  child: const Text(
                    'See Approved',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 17,
                    ),
                  ),
                )
              ],
            ),
            const RequestsToApproveList(),
          ],
        ),
      ),
    );
  }
}
