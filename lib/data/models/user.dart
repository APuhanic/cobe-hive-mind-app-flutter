enum UserStatus {
  online,
  offline,
  parental,
  away,
  sick,
  vacation,
  other,
}

class User {
  String? id;
  String? name;
  String? surname;
  String? role;
  UserStatus? status;
  bool? isAdmin;
  String? email;
  String? phone;
  String? imageUrl;

  User({
    this.id,
    this.name,
    this.surname,
    this.role,
    this.status,
    this.isAdmin,
    this.email,
    this.phone,
    this.imageUrl,
  });
  UserStatus _convertUserStatus(status) {
    switch (status) {
      case 'online':
        return UserStatus.online;
      case 'offline':
        return UserStatus.offline;
      case 'parental':
        return UserStatus.parental;
      case 'away':
        return UserStatus.away;
      case 'sick':
        return UserStatus.sick;
      case 'vacation':
        return UserStatus.vacation;
      case 'other':
        return UserStatus.other;
      default:
        return UserStatus.offline;
    }
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    role = json['role'];
    status = _convertUserStatus(json['status']);
    isAdmin = json['isAdmin'];
    email = json['email'];
    phone = json['phone'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['role'] = role;
    data['status'] = status;
    data['isAdmin'] = isAdmin;
    data['email'] = email;
    data['phone'] = phone;
    data['imageUrl'] = imageUrl;

    return data;
  }
}
