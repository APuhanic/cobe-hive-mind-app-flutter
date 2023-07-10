import 'package:cobe_hive_mobile_app/user_list_test.dart';
import 'package:cobe_hive_mobile_app/user_search_provider.dart';
import 'package:cobe_hive_mobile_app/user_ui_model.dart';
import 'package:cobe_hive_mobile_app/widgets/chip_list.dart';
import 'package:cobe_hive_mobile_app/widgets/employee_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cobe_hive_mobile_app/user_filter_provider.dart';

final statusFilterMap = {
  UserStatus.online: StatusFilter.online,
  UserStatus.offline: StatusFilter.offline,
  UserStatus.sick: StatusFilter.sick,
  UserStatus.away: StatusFilter.away,
  UserStatus.vacation: StatusFilter.vacation,
  UserStatus.parental: StatusFilter.parental,
  UserStatus.other: StatusFilter.other,
};

class EmployeeCardList extends StatelessWidget {
  const EmployeeCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final userFilter = Provider.of<UserFilterProvider>(context);
    final searchFilter = Provider.of<UserSearchProvider>(context);

    List<UserUiModel> filteredUsers = UserListTest.users.where(
      (user) {
        if (userFilter.isFilterSelected(StatusFilter.all) ||
            userFilter.isFilterEmpty()) {
          return true;
        }

        final userStatusFilter = statusFilterMap[user.status];
        return userFilter.isFilterSelected(userStatusFilter!);
      },
    ).toList();

    List<UserUiModel> searchedUsers = filteredUsers.where(
      (user) {
        if (searchFilter.searchQuery.isEmpty) {
          return true;
        }
        if (user.name.toLowerCase().contains(searchFilter.searchQuery) ||
            user.surname.toLowerCase().contains(searchFilter.searchQuery)) {
          return true;
        }
        return false;
      },
    ).toList();

    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final user = searchedUsers[index];
          return EmployeeCard(user);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: searchedUsers.length,
      ),
    );
  }
}
