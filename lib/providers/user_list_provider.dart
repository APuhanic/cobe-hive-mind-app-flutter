import 'package:cobe_hive_mobile_app/data/user_list_test.dart';
import 'package:cobe_hive_mobile_app/data/user_ui_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userListProvider = Provider<List<UserUiModel>>((ref) {
  return UserListTest.users;
});
