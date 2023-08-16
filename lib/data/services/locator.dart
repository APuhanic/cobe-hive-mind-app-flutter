import 'package:cobe_hive_mobile_app/data/shared/token_shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async => getIt.registerSingleton<TokenSharedPreferences>(
    TokenSharedPreferences(await SharedPreferences.getInstance()));
