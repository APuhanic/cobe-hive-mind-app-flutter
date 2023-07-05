import 'package:cobe_hive_mobile_app/widgets/employee_card.dart';
import 'package:flutter/material.dart';

class EmployeeCardList extends StatelessWidget {
  EmployeeCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return EmployeeCard();
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: 10,
      ),
    );
  }
}
