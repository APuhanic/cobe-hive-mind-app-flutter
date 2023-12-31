import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/data/services/hive.dart';
import 'package:cobe_hive_mobile_app/screens/admin_home_screen.dart';
import 'package:cobe_hive_mobile_app/screens/create_request_screen.dart';
import 'package:cobe_hive_mobile_app/screens/edit_profile_screen.dart';
import 'package:cobe_hive_mobile_app/screens/home_screen.dart';
import 'package:cobe_hive_mobile_app/screens/login_screen.dart';
import 'package:cobe_hive_mobile_app/screens/private_profile_screen.dart';
import 'package:cobe_hive_mobile_app/screens/public_profile_screen.dart';
import 'package:cobe_hive_mobile_app/screens/request_board_approved_screen.dart';
import 'package:cobe_hive_mobile_app/screens/request_board_screen.dart';
import 'package:cobe_hive_mobile_app/screens/request_details_screen.dart';
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
              titleMedium: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: AppColors.text,
              ),
              labelMedium: TextStyle(
                fontSize: 16,
                color: AppColors.text,
              ),
              labelLarge: TextStyle(
                fontSize: 20,
                color: AppColors.text,
              ))),
      initialRoute: '/login',
      builder: (context, child) {
        return SafeArea(child: child!);
      },
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/create-request': (context) => const CreateRequestScreen(),
        '/admin-home-screen': (context) => const AdminHomeScreen(),
        '/request-board': (context) => const RequestBoardScreen(),
        '/request-board-approved': (context) =>
            const RequestBoardApprovedScreen(),
        '/request-details': (context) => const RequestDetailsScreen(),
        '/private-profile-screen': (context) => const PrivateProfileScreen(),
        '/public-profile-screen': (context) => const PublicProfileScreen(),
        '/edit-profile-screen': (context) => const EditProfileScreen(),
      },
    );
  }
}
