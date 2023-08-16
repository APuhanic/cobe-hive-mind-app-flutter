class LoginResponse {
  String? userId;
  String? accessToken;
  String? refreshToken;

  LoginResponse({
    this.userId,
    this.accessToken,
    this.refreshToken,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };
}
