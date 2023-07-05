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
          scaffoldBackgroundColor: const Color.fromRGBO(246, 248, 252, 1),
          fontFamily: "FilsonPro",
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(61, 71, 102, 1),
            ),
            bodyMedium: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(61, 71, 102, 1),
            ),
            bodySmall: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(61, 71, 102, 1),
            ),
          )),
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
      builder: (context, child) {
        return SafeArea(child: child!);
      },
    );
  }
}
