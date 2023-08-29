import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/data/routes/routes.dart';
import 'package:cobe_hive_mobile_app/data/services/hive.dart';
import 'package:cobe_hive_mobile_app/themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cobe_hive_mobile_app/data/services/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupHive();
  await setupSharedPrefereces();
  runApp(const ProviderScope(
    child: CobeHiveApp(),
  ));
}

class CobeHiveApp extends StatelessWidget {
  const CobeHiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'FilsonPro',
        textTheme: textTheme,
      ),
      initialRoute: '/login',
      builder: (context, child) => SafeArea(child: child!),
      routes: appRoutes,
    );
  }
}
