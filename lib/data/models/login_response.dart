import 'package:cobe_hive_mobile_app/data/models/user.dart';

class LoginResponse {
  String? userID;
  User? user;
  int? statusCode;

  LoginResponse({
    this.userID,
    this.user,
    this.statusCode,
  });
}
