import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/capitalize_string.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/data/constants/endpoints.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final User user;
  const EmployeeCard(
    this.user, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.widgetBackground,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      '${Endpoints.baseUrl}${user.imageUrl}',
                    ),
                  ),
                ),
                if (user.status == UserStatus.online)
                  Positioned(
                    top: 5,
                    right: 25,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: const BoxDecoration(
                            color: AppColors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name} ${user.surname}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  user.status!.name.toString().capitalize(),
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.textAccent,
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
