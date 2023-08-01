import 'package:cobe_hive_mobile_app/providers/home_screen_providers/filtered_users_list_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/admin_and_home_widgets/employee_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmployeeCardList extends ConsumerWidget {
  const EmployeeCardList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredUsers = ref.watch(filteredUserListProvider);
    return filteredUsers.when(
      data: (users) {
        return Expanded(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: users.length,
            itemBuilder: (context, index) {
              return EmployeeCard(users[index]);
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Text(
          'Error: $error',
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
