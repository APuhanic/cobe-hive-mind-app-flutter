import 'package:cobe_hive_mobile_app/data/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioClientProvider = Provider<DioClient>((ref) => DioClient(Dio(), ref));
