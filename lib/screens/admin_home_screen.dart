import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/leave_request_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/app_header.dart';
import 'package:cobe_hive_mobile_app/widgets/chip_list.dart';
import 'package:cobe_hive_mobile_app/widgets/employee_card_list.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_list.dart';
import 'package:cobe_hive_mobile_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import 'package:cobe_hive_mobile_app/widgets/expandable_fab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminHomeScreen extends ConsumerWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const AppHeader(),
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 25),
              child: _ManageRequestsBar(),
            ),
            SizedBox(
              height:
                  150, //zasto height ako vec ima definirarn height u widgetu za leaverequesttstatuscard
              child: LeaveRequestStatusList(
                leaveRequestList: ref.watch(leaveRequestListPendingProvider),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 8),
              child: CobeSearchBar(),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: SizedBox(
                height: 65,
                child: ChipList(),
              ),
            ),
            const EmployeeCardList(),
          ],
        ),
        floatingActionButton: const ExpandableFAB(),
      ),
    );
  }
}

class _ManageRequestsBar extends StatelessWidget {
  const _ManageRequestsBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Manage Requests',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/request-board');
            },
            child: const Text(
              'See all',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textOrange,
              ),
            ))
      ],
    );
  }
}
