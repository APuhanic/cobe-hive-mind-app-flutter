import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/login_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loggedInUserProvider =
    Provider<User?>((ref) => ref.watch(loginProvider).maybeWhen(
          success: (loginResponse) => loginResponse.user,
          orElse: () => null,
        ));
