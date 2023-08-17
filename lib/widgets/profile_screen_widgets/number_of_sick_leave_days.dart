import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NumberOfSickLeaveDays extends StatelessWidget {
  const NumberOfSickLeaveDays({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(0, 2),
            blurRadius: 15.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.09,
              height: MediaQuery.of(context).size.height * 0.09,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.red,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.redShadow,
                      offset: Offset(0, 2),
                      blurRadius: 11.0,
                    )
                  ]),
              child: Image.asset('images/sick_leave_icon.png'),
            ),
            const SizedBox(width: 10),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '7 days',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Sick leave',
                  style: TextStyle(
                    color: AppColors.graySecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
