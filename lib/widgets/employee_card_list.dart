import 'package:cobe_hive_mobile_app/providers/filtered_users_list_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/employee_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmployeeCardList extends ConsumerWidget {
  const EmployeeCardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredUserList = ref.watch(filteredUserListProvider);

    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: filteredUserList.length,
        itemBuilder: (context, index) {
          final user = filteredUserList[index];
          return EmployeeCard(user);
        },
      ),
    );
  }
}
