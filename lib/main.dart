import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:cobe_hive_mobile_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CobeHiveApp());
}

class CobeHiveApp extends StatelessWidget {
  const CobeHiveApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          fontFamily: "FilsonPro",
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
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
      builder: (context, child) {
        return SafeArea(child: child!);
      },
    );
  }
}
