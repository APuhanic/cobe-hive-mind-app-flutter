import 'package:cobe_hive_mobile_app/data/repository/user_repository.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/user_api_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref.read(userApiProvider));
});
