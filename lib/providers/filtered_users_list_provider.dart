import 'package:cobe_hive_mobile_app/providers/user_filter_provider.dart';
import 'package:cobe_hive_mobile_app/providers/user_list_provider.dart';
import 'package:cobe_hive_mobile_app/providers/user_search_provider.dart';
import 'package:cobe_hive_mobile_app/user_ui_model.dart';
import 'package:cobe_hive_mobile_app/widgets/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final statusFilterMap = {
  UserStatus.online: StatusFilter.online,
  UserStatus.offline: StatusFilter.offline,
  UserStatus.sick: StatusFilter.sick,
  UserStatus.away: StatusFilter.away,
  UserStatus.vacation: StatusFilter.vacation,
  UserStatus.parental: StatusFilter.parental,
  UserStatus.other: StatusFilter.other,
};

final filteredUserListProvider = Provider((ref) {
  final searchQuery = ref.watch(userSearchProvider);
  final userList = ref.watch(userListProvider);

  List<UserUiModel> filteredUsers = userList.where(
    (user) {
      if (ref.watch(isFilterSelectedProvider(StatusFilter.all)) ||
          ref.watch(isFilterEmptyProvider)) {
        return true;
      }

      return ref.watch(isFilterSelectedProvider(statusFilterMap[user.status]!));
    },
  ).toList();

  List<UserUiModel> searchedUsers = filteredUsers.where((user) {
    debugPrint(user.name.toString());

    if (searchQuery.isEmpty) {
      return true;
    }

    if (user.name.toLowerCase().contains(searchQuery) ||
        user.surname.toLowerCase().contains(searchQuery)) {
      return true;
    }

    return false;
  }).toList();

  return searchedUsers;
});
