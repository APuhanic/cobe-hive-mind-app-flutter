import 'package:cobe_hive_mobile_app/data/network/cobe_api.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/dio_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cobeApiProvider =
    Provider<CobeApi>((ref) => CobeApi(ref.watch(dioClientProvider)));
