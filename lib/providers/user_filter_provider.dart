import 'package:cobe_hive_mobile_app/widgets/chip_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userFilterProvider =
    StateNotifierProvider<UserFilter, Set<StatusFilter>>((ref) => UserFilter());

class UserFilter extends StateNotifier<Set<StatusFilter>> {
  UserFilter() : super(<StatusFilter>{});

  void toggleFilter(StatusFilter filter) {
    if (state.contains(filter)) {
      state = state.difference({filter});
    } else {
      state = {...state, filter};
    }
  }
}

final isFilterSelectedProvider =
    Provider.family<bool, StatusFilter>((ref, filter) {
  final userFilter = ref.watch(userFilterProvider);
  return userFilter.contains(filter);
});

final isFilterEmptyProvider = Provider<bool>((ref) {
  final userFilter = ref.watch(userFilterProvider);
  return userFilter.isEmpty;
});