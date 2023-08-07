import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/data/repository/user_repository.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/user_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loggedInUserProvider = StateNotifierProvider<Notifier, User>((ref) {
  return Notifier(ref.read(userRepositoryProvider));
});

class Notifier extends StateNotifier<User> {
  final UserRepository userRepository;

  Notifier(this.userRepository) : super(User());

  Future<User> getLoggedInUser(String id) async {
    final response = await userRepository.getUserById(id);
    //state = response;
    return response;
  }
}
