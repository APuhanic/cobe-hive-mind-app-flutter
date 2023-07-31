import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/widgets/admin_and_home_widgets/app_header.dart';
import 'package:cobe_hive_mobile_app/widgets/admin_and_home_widgets/chip_list.dart';
import 'package:cobe_hive_mobile_app/widgets/admin_and_home_widgets/employee_card_list.dart';
import 'package:cobe_hive_mobile_app/widgets/admin_and_home_widgets/admin_screen_request_list.dart';
import 'package:cobe_hive_mobile_app/widgets/admin_and_home_widgets/search_bar.dart';
import 'package:flutter/material.dart';

import 'package:cobe_hive_mobile_app/widgets/expandable_fab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminHomeScreen extends ConsumerWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body: Column(
          children: <Widget>[
            AppHeader(),
            Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 25),
              child: _ManageRequestsBar(),
            ),
            SizedBox(
              height: 150,
              child: AdminScreenRequestList(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 8),
              child: CobeSearchBar(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: SizedBox(
                height: 65,
                child: ChipList(),
              ),
            ),
            EmployeeCardList(),
          ],
        ),
        floatingActionButton: ExpandableFAB(),
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
            onPressed: () => Navigator.pushNamed(context, '/request-board'),
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
