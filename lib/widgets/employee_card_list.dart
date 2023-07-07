import 'package:cobe_hive_mobile_app/user_ui_model.dart';
import 'package:cobe_hive_mobile_app/widgets/employee_card.dart';
import 'package:flutter/material.dart';

class EmployeeCardList extends StatelessWidget {
  const EmployeeCardList({super.key});
  //listt of UserUiModel
  //const EmployeeCardList({required this.employees, super.key});

  @override
  Widget build(BuildContext context) {
    final List<UserUiModel> users = [
      UserUiModel(
        name: 'Wade ',
        surname: 'Warren',
        status: UserStatus.online,
        description: 'Text here',
      ),
      UserUiModel(
        name: 'Marry ',
        surname: 'Roe',
        status: UserStatus.offline,
        description: 'Text here',
      ),
      UserUiModel(
        name: 'Tom ',
        surname: 'Smith',
        status: UserStatus.parental,
        description: 'Text here',
      ),
      UserUiModel(
        name: 'Morgan ',
        surname: 'Reed',
        status: UserStatus.sick,
        description: 'Text here',
      ),
      UserUiModel(
        name: 'Jane ',
        surname: 'Cooper',
        status: UserStatus.vacation,
        description: 'Text here',
      ),
      UserUiModel(
        name: 'Arlene ',
        surname: 'McCoy',
        status: UserStatus.away,
        description: 'Text here',
      ),
      UserUiModel(
        name: 'Jonn ',
        surname: 'Doe',
        status: UserStatus.other,
        description: 'Text here',
      ),
    ];

    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final user = users[index];
          return EmployeeCard(user);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: users.length,
      ),
    );
  }
}
