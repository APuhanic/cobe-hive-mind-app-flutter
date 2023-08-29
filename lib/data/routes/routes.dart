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

var appRoutes = {
  '/home': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/create-request': (context) => const CreateRequestScreen(),
  '/admin-home-screen': (context) => const AdminHomeScreen(),
  '/request-board': (context) => const RequestBoardScreen(),
  '/request-board-approved': (context) => const RequestBoardApprovedScreen(),
  '/request-details': (context) => const RequestDetailsScreen(),
  '/private-profile-screen': (context) => const PrivateProfileScreen(),
  '/public-profile-screen': (context) => const PublicProfileScreen(),
  '/edit-profile-screen': (context) => const EditProfileScreen(),
};
