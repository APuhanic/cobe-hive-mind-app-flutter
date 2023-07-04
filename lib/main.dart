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
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color.fromRGBO(242, 247, 255, 1),
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
