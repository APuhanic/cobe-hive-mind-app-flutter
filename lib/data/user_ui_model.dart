enum UserStatus {
  online,
  offline,
  parental,
  away,
  sick,
  vacation,
  other,
}

class UserUiModel {
  final String name;
  final String surname;
  final UserStatus status;
  final String description;

  UserUiModel({
    required this.name,
    required this.surname,
    required this.status,
    required this.description,
  });
}
