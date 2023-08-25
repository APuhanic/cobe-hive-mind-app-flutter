import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedPreferences {
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';

  final SharedPreferences prefs;

  TokenSharedPreferences(this.prefs);

  String? getAccessToken() => prefs.getString(accessToken) ?? '';
  setAccessToken(String userToken) => prefs.setString(accessToken, userToken);

  String? getRefreshToken() => prefs.getString(refreshToken) ?? '';
  setRefreshToken(String userToken) => prefs.setString(refreshToken, userToken);
}
