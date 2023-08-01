import 'package:cobe_hive_mobile_app/data/network/user_api.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/dio_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userApiProvider =
    Provider<UserApi>((ref) => UserApi(ref.watch(dioClientProvider)));
