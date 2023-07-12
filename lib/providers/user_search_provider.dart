import 'package:hooks_riverpod/hooks_riverpod.dart';

final userSearchProvider =
    StateNotifierProvider<UserSearchProvider, String>((ref) {
  return UserSearchProvider();
});

class UserSearchProvider extends StateNotifier<String> {
  UserSearchProvider() : super('');
  void setSearchQuery(String query) {
    state = query;
  }
}
