import 'package:cobe_hive_mobile_app/user_search_provider.dart';
import 'package:cobe_hive_mobile_app/user_ui_model.dart';
import 'package:cobe_hive_mobile_app/widgets/employee_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cobe_hive_mobile_app/user_filter_provider.dart';

class EmployeeCardList extends StatelessWidget {
  const EmployeeCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<UserUiModel> users = [
      UserUiModel(
        name: 'Wade ',
        surname: 'Warren',
        status: UserStatus.online,
        description: 'Text here',
      ),
      UserUiModel(
        name: 'Marry ',
        surname: 'Roe',
        status: UserStatus.offline,
        description: 'Text here',
      ),
      UserUiModel(
        name: 'Tom ',
        surname: 'Smith',
        status: UserStatus.parental,
        description: 'Text here',
      ),
      UserUiModel(
        name: 'Morgan ',
        surname: 'Reed',
        status: UserStatus.sick,
        description: 'Text here',
      ),
      UserUiModel(
        name: 'Jane ',
        surname: 'Cooper',
        status: UserStatus.vacation,
        description: 'Text here',
      ),
      UserUiModel(
        name: 'Arlene ',
        surname: 'McCoy',
        status: UserStatus.away,
        description: 'Text here',
      ),
      UserUiModel(
        name: 'Jonn ',
        surname: 'Doe',
        status: UserStatus.other,
        description: 'Text here',
      ),
    ];
    final userFilter = Provider.of<UserFilterProvider>(context);
    final searchFilter = Provider.of<UserSearchProvider>(context);
    List<UserUiModel> filteredUsers = users.where(
      (user) {
        if (userFilter.isFilterSelected('All') || userFilter.isFilterEmpty()) {
          return true;
        }
        if (userFilter.isFilterSelected('Online') &&
            user.status == UserStatus.online) {
          return true;
        }
        if (userFilter.isFilterSelected('Offline') &&
            user.status == UserStatus.offline) {
          return true;
        }
        if (userFilter.isFilterSelected('Sick') &&
            user.status == UserStatus.sick) {
          return true;
        }
        if (userFilter.isFilterSelected('Away') &&
            user.status == UserStatus.away) {
          return true;
        }
        if (userFilter.isFilterSelected('Vacation') &&
            user.status == UserStatus.vacation) {
          return true;
        }
        if (userFilter.isFilterSelected('Parental') &&
            user.status == UserStatus.parental) {
          return true;
        }
        if (userFilter.isFilterSelected('Other') &&
            user.status == UserStatus.other) {
          return true;
        }
        return false;
      },
    ).toList();

    List<UserUiModel> searchedUsers = filteredUsers.where(
      (user) {
        debugPrint(user.name.toLowerCase() + user.surname.toLowerCase());
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
