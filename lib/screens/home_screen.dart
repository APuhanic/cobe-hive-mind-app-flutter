import 'package:cobe_hive_mobile_app/widgets/app_header.dart';
import 'package:cobe_hive_mobile_app/widgets/chip_list.dart';
import 'package:cobe_hive_mobile_app/widgets/employee_card_list.dart';
import 'package:cobe_hive_mobile_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/expandable_fab.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            AppHeader(),
            Padding(
              padding:
                  EdgeInsets.only(left: 18, right: 18, top: 28, bottom: 12),
              child: CobeSearchBar(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, bottom: 18),
              child: SizedBox(
                height: 60, //zašto height?
                child: ChipList(),
              ),
            ),
            EmployeeCardList(),
          ],
        ),
      ),
      floatingActionButton: ExpandableFAB(),
    );
  }
}
