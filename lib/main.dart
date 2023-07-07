import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:cobe_hive_mobile_app/screens/home_screen.dart';
import 'package:cobe_hive_mobile_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CobeHiveApp());
}

class CobeHiveApp extends StatelessWidget {
  const CobeHiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          fontFamily: 'FilsonPro',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
            bodyMedium: TextStyle(
              fontSize: 20,
              color: AppColors.text,
            ),
            bodySmall: TextStyle(
              fontSize: 15,
              color: AppColors.text,
            ),
          )),
      home: const HomeScreen(),
      builder: (context, child) {
        return SafeArea(child: child!);
      },
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
