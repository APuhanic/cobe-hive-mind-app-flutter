import 'package:cobe_hive_mobile_app/providers/network_providers/login_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = Provider<String>((ref) {
  final id = ref.watch(loginProvider).userID;
  return id!;
});
