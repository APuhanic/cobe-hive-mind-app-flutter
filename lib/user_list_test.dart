import 'package:cobe_hive_mobile_app/user_ui_model.dart';

abstract class UserListTest {
  static final List<UserUiModel> users = [
    UserUiModel(
      name: 'Wade',
      surname: 'Warren',
      status: UserStatus.online,
      description: 'Text here',
    ),
    UserUiModel(
      name: 'Marry',
      surname: 'Roe',
      status: UserStatus.offline,
      description: 'Text here',
    ),
    UserUiModel(
      name: 'Tom',
      surname: 'Smith',
      status: UserStatus.parental,
      description: 'Text here',
    ),
    UserUiModel(
      name: 'Morgan',
      surname: 'Reed',
      status: UserStatus.sick,
      description: 'Text here',
    ),
    UserUiModel(
      name: 'Jane',
      surname: 'Cooper',
      status: UserStatus.vacation,
      description: 'Text here',
    ),
    UserUiModel(
      name: 'Arlene',
      surname: 'McCoy',
      status: UserStatus.away,
      description: 'Text here',
    ),
    UserUiModel(
      name: 'Jonn',
      surname: 'Doe',
      status: UserStatus.other,
      description: 'Text here',
    ),
    UserUiModel(
      name: 'Bobby',
      surname: 'Brown',
      status: UserStatus.online,
      description: 'Text here',
    ),
    UserUiModel(
      name: 'George',
      surname: 'Smith',
      status: UserStatus.offline,
      description: 'Text here',
    ),
    UserUiModel(
      name: 'Tom',
      surname: 'Smith',
      status: UserStatus.parental,
      description: 'Text here',
    ),
    UserUiModel(
      name: 'Morgan',
      surname: 'Reed',
      status: UserStatus.sick,
      description: 'Text here',
    ),
    UserUiModel(
      name: 'Jane',
      surname: 'Cooper',
      status: UserStatus.vacation,
      description: 'Text here',
    ),
  ];
}
