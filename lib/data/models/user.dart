import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
enum UserStatus {
  @HiveField(0)
  online,
  @HiveField(1)
  offline,
  @HiveField(2)
  parental,
  @HiveField(3)
  away,
  @HiveField(4)
  sick,
  @HiveField(5)
  vacation,
  @HiveField(6)
  other,
}

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? surname;
  @HiveField(3)
  String? role;
  @HiveField(4)
  UserStatus? status;
  @HiveField(5)
  bool? isAdmin;
  @HiveField(6)
  String? email;
  @HiveField(7)
  String? phone;
  @HiveField(8)
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

  UserStatus _convertToUserStatus(status) {
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
    status = _convertToUserStatus(json['status']);
    isAdmin = json['isAdmin'];
    email = json['email'];
    phone = json['phone'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'surname': surname,
        'role': role,
        'status': status,
        'isAdmin': isAdmin,
        'email': email,
        'phone': phone,
        'imageUrl': imageUrl,
      };
}
