import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/data/repository/user_repository.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/user_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userListProvider = StateNotifierProvider<UserListNotifier, List<User>>(
    (ref) => UserListNotifier(ref.read(userRepositoryProvider)));

class UserListNotifier extends StateNotifier<List<User>> {
  UserListNotifier(this.userRepository) : super([]) {
    getUsers();
  }
  final UserRepository userRepository;

  Future<void> getUsers() async {
    await userRepository.getUsers().then((value) => state = value);
  }
}
