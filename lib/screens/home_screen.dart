import 'package:cobe_hive_mobile_app/widgets/admin_and_home_widgets/app_header.dart';
import 'package:cobe_hive_mobile_app/widgets/admin_and_home_widgets/chip_list.dart';
import 'package:cobe_hive_mobile_app/widgets/admin_and_home_widgets/employee_card_list.dart';
import 'package:cobe_hive_mobile_app/widgets/admin_and_home_widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:cobe_hive_mobile_app/widgets/expandable_fab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppHeader(),
          Padding(
            padding: EdgeInsets.only(left: 18, right: 18, top: 28, bottom: 8),
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
    );
  }
}
