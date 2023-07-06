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
        name: "Wade ",
        surname: "Warren",
        status: "Online",
        description: "Text here",
      ),
      UserUiModel(
        name: "Marry ",
        surname: "Roe",
        status: "Offline",
        description: "Text here",
      ),
      UserUiModel(
        name: "Tom ",
        surname: "Smith",
        status: "Online",
        description: "Text here",
      ),
      UserUiModel(
        name: "Morgan ",
        surname: "Reed",
        status: "Offline",
        description: "Text here",
      ),
      UserUiModel(
        name: "Jane ",
        surname: "Cooper",
        status: "Offline",
        description: "Text here",
      ),
      UserUiModel(
        name: "Arlene ",
        surname: "McCoy",
        status: "Online",
        description: "Text here",
      ),
      UserUiModel(
        name: "Jonn ",
        surname: "Doe",
        status: "Online",
        description: "Text here",
      ),
    ];

    return Expanded(
      //pitati zašto je ovo potrebno
      child: ListView.separated(
        shrinkWrap: true,
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
