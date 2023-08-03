import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/user_list_provider.dart';
import 'package:cobe_hive_mobile_app/providers/home_screen_providers/user_filter_provider.dart';
import 'package:cobe_hive_mobile_app/providers/home_screen_providers/user_search_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/admin_and_home_widgets/chip_list.dart';
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

final filteredUserListProvider = FutureProvider<List<User>>((ref) async {
  final searchQuery = ref.watch(userSearchProvider);
  final userList = ref.watch(userListProvider);
  final userFilter = ref.watch(userFilterProvider);

  List<User> filteredUsers = userList.where(
    (user) {
      if (userFilter.contains(StatusFilter.all) || userFilter.isEmpty) {
        return true;
      }
      return userFilter.contains(statusFilterMap[user.status]);
    },
  ).toList();

  List<User> searchedUsers = filteredUsers.where((user) {
    if (searchQuery.isEmpty) {
      return true;
    }
    if (user.name!.toLowerCase().contains(searchQuery) ||
        user.surname!.toLowerCase().contains(searchQuery) ||
        '${user.name} ${user.surname}'.toLowerCase().contains(searchQuery)) {
      return true;
    }

    return false;
  }).toList();

  return searchedUsers;
});
