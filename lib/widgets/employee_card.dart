import 'package:cobe_hive_mobile_app/user_ui_model.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final UserUiModel user;
  const EmployeeCard(
    this.user, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint(user.name);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(58, 73, 88, 0.08),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Image.asset(
                  'images/profile_photo.png',
                  width: 80,
                  height: 80,
                ),
              ),
              if (user.status == "Online")
                Positioned(
                  top: 15,
                  right: 32,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 186, 136, 1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user.name} ${user.surname}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(61, 71, 102, 1),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  user.status,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(188, 196, 220, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
