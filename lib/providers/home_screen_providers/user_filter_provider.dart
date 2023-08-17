import 'package:cobe_hive_mobile_app/widgets/admin_and_home_widgets/chip_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userFilterProvider =
    StateNotifierProvider<UserFilter, Set<StatusFilter>>((ref) => UserFilter());

class UserFilter extends StateNotifier<Set<StatusFilter>> {
  UserFilter() : super(<StatusFilter>{});

  void toggleFilter(StatusFilter filter) => state =
      state.contains(filter) ? state.difference({filter}) : {...state, filter};
}

final isFilterSelectedProvider = Provider.family<bool, StatusFilter>(
    (ref, filter) => ref.watch(userFilterProvider).contains(filter));

final isFilterEmptyProvider =
    Provider<bool>((ref) => ref.watch(userFilterProvider).isEmpty);
